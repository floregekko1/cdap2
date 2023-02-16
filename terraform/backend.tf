terraform {
	backend "s3" {
    bucket = "cdap-mod-yve"
    key    = "terraform.tfstate"
    region = "eu-west-3"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region  = "eu-west-3"
}