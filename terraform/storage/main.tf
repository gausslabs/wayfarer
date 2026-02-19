provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "artifact_store" {
  bucket = "hdk-artifact-bucket"
}

resource "aws_s3_bucket_ownership_controls" "artifact_store" {
  bucket = aws_s3_bucket.artifact_store.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "private_access" {
  depends_on = [aws_s3_bucket_ownership_controls.artifact_store]

  bucket = aws_s3_bucket.artifact_store.id
  acl    = "private"
}