# Configure terraform version
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 1.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# Configure AWS Resource [Private Bucket With Tags]
resource "aws_s3_bucket" "roger437unix" {
  bucket = "roger437unix"

  tags = {
    Name        = "roger437unix"
    Environment = "Developer"
  }
}
