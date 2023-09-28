terraform {
  required_version = ">= 0.12.9"

  required_providers {
    aws = {
      version = ">=4.15.1"
    }
  }

  backend "s3" {
    bucket  = "terraform-state-tbe"
    key     = "common/terraform.tfstate"
    region  = "eu-west-2"
    profile = "localstack"
  }
}

provider "aws" {
  profile = var.aws_profile
  region  = var.aws_region
}

module "s3" {
  source      = "../modules/s3"
}
