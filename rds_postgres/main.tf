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

resource "aws_security_group" "postgres-rg" {
  name_prefix = "postgres-rg"
  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Configure AWS Resource [Private Bucket With Tags]
resource "aws_db_instance" "postgres" {
    allocated_storage    = 20    
    engine               = "postgres"
    engine_version       = "16.2"
    identifier           = "postgres-1"
    instance_class       = "db.t3.micro"
    db_name              = "db_loja"
    username             = "postgres"
    password             = "ABC123xyz"
    skip_final_snapshot  = true
    storage_encrypted    = false
    publicly_accessible    = true    
    vpc_security_group_ids = [aws_security_group.postgres-rg.id]
    apply_immediately = true
  }