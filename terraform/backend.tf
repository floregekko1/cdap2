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
  region = "eu-west-2"
}

data "terraform_remote_state" "cdap-jb-beaura" {
  backend = "s3"
  config = {
    bucket = "cdap-jb-beaura"
    key    = "terraform.tfstate"
    region = "eu-west-2"
  }
}