provider "aws" {
  region = "us-east-1"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]  # Canonical's owner ID
}

variable "machine_type" {
  type = string
  default = "f2.6xlarge"
  description = "This is type of machine started."
}

data "aws_vpc" "default" {
  default = true
}

resource "aws_iam_role" "dev_role" {
  name = "ec2_fpga_full_access_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# Create a custom IAM policy granting full access to EC2 and S3
resource "aws_iam_policy" "ec2_s3_full_access" {
  name        = "EC2S3FpgaFullAccessPolicy"
  description = "Policy granting full access to EC2 and S3"
  policy      = jsonencode({
    Version   = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = [
          "ec2:*",
          "s3:*"
        ],
        Resource = "*"
      }
    ]
  })
}

# Attach the custom policy to the IAM role
resource "aws_iam_role_policy_attachment" "attach_custom_policy" {
  role       = aws_iam_role.dev_role.name
  policy_arn = aws_iam_policy.ec2_s3_full_access.arn
}

# Create an instance profile to attach the role to an EC2 instance
resource "aws_iam_instance_profile" "dev_profile" {
  name = "fpga_profile"
  role = aws_iam_role.dev_role.name
}

resource "aws_security_group" "ec2_sg" {
  name        = "dev-ssh-access"
  description = "Allow SSH (22) from anywhere"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}


resource "aws_key_pair" "generated_key" {
  key_name   = "fpga-ssh-key"  # Change the key name as needed
  public_key = tls_private_key.ssh_key.public_key_openssh
}


resource "aws_instance" "fpga_dev_instance" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.machine_type
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  key_name      = aws_key_pair.generated_key.key_name

  iam_instance_profile = aws_iam_instance_profile.dev_profile.name

  # Root volume configuration (120 GB)
  root_block_device {
    volume_size = 120
    volume_type = "gp2"
  }

  tags = {
    Name = "FPGA-TEST-MACHINE"
  }

  # user_data = <<-EOF
  #   #!/bin/bash
  #   git clone https://github.com/aws/aws-fpga.git /home/ubuntu/aws-fpga
  # EOF
}


output "private_key_pem" {
  value     = tls_private_key.ssh_key.private_key_pem
  sensitive = true
}

output "ec2_instance_public_ip" {
  description = "The public IP address of the instance"
  value       = aws_instance.fpga_dev_instance.public_ip
}
