#this script download module from a github repo

module "s3" {
  source = "git@github.com:talk2walykay/s3-backend-repo.git//s3-module?ref=v1.2.1" #using SSH url
  #source = "git::https://github.com/talk2walykay/s3-backend-repo.git//s3-module?ref=v1.1.1" #using HTTPS url
}

#Backend configuration
# Terraform Settings Block
terraform {
  required_version = "~> 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket  = "expertdotcom-bucket"
    region  = "us-west-2"
    key     = "s3/terraform.tfstate"
    encrypt = true
  }
}


# Provider Block
provider "aws" {
  region = "us-west-2"
  #profile = "default"
}