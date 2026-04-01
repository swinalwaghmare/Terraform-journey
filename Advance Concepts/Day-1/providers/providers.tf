provider "aws" {
    region = "us-east-1"

    assume_role {
      role_arn = "arn:aws:iam::131707624275:role/terraform-role"
      session_name = "assume-role"
    }
}

terraform {
    required_version = ">=1.6.0"

    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "~> 6.0"
      }
    }
}
