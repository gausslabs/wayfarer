provider "aws" {
  region = "us-east-1"
}

variable "use_x86" {
  type = bool
  default = true
}

data "aws_vpc" "default" {
  default = true
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
  key_name   = "rust-ssh-key"  # Change the key name as needed
  public_key = tls_private_key.ssh_key.public_key_openssh
}


resource "aws_instance" "rust_dev_instance" {
  ami           = var.use_x86 ? "ami-084568db4383264d4" : "ami-0c4e709339fa8521a"
  instance_type = var.use_x86 ? "r7a.2xlarge" : "r8g.2xlarge"
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  key_name      = aws_key_pair.generated_key.key_name

  # Root volume configuration (120 GB)
  root_block_device {
    volume_size = 120
    volume_type = "gp2"
  }

  tags = {
    Name = "RUST-TEST-MACHINE"
  }

  user_data = <<-EOF
    #!/bin/bash
    sudo apt-get update
    sudo apt install build-essential -y
    git clone https://github.com/phantomzone-org/wayfarer.git /home/ubuntu/wayfarer
    chown -R ubuntu /home/ubuntu/wayfarer
    curl https://sh.rustup.rs -sSf | sh -s -- -y
  EOF
}


output "private_key_pem" {
  value     = tls_private_key.ssh_key.private_key_pem
  sensitive = true
}

output "ec2_instance_public_ip" {
  description = "The public IP address of the instance"
  value       = aws_instance.rust_dev_instance.public_ip
}
