terraform {
    backend "s3" {
    bucket = "cdap-jb-beaura"
    key    = "terraform.tfstate"
    region = "eu-west-2"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region  = "eu-west-2"
}