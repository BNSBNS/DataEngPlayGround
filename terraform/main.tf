locals {
  aws_region = var.aws_region
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.74.2"  # version 4 has issues
    }
  }
}

provider "aws" {
  region = local.aws_region
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


/*

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}

*/

