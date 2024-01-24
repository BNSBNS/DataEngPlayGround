terraform {
  required_version = ">= 0.12"
}

provider "aws" {
  region = var.aws_region
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_ownership_controls#BucketOwnerEnforced

# first bucket
resource "aws_s3_bucket" "input-bucketr234asdq" {
  bucket = "input-bucketr234asdq"
}

resource "aws_s3_bucket_ownership_controls" "input-bucketr234asdq" {
  bucket = aws_s3_bucket.input-bucketr234asdq.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

# second bucket
resource "aws_s3_bucket" "processed-bucketr234asdq" {
  bucket = "processed-bucketr234asdq"
}

resource "aws_s3_bucket_ownership_controls" "processed-bucketr234asdq" {
  bucket = aws_s3_bucket.processed-bucketr234asdq.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}