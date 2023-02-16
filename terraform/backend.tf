terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-west-1"
}

data "terraform_remote_state" "cdap-elisee-bakary" {
  backend = "s3"
  config = {
    bucket = "cdap-elisee-bakary"
    key    = "terraform.tfstate"
    region = "eu-west-1"
  }
}