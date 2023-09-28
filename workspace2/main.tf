terraform {
  required_version = ">= 0.12.9"

  required_providers {
    aws = {
      version = "5.13.1"
    }
  }

  backend "s3" {
    bucket  = "terraform-state-tbe"
    key     = "terraform.tfstate"
    region  = "eu-west-2"
    profile = "localstack"
  }
}

provider "aws" {
  profile = var.aws_profile
  region  = var.aws_region
}

data "terraform_remote_state" "this" {
  backend = "s3"
  config = {
    bucket  = "terraform-state-tbe"
    key     = "env:/local/common/terraform.tfstate"
    region  = "eu-west-2"
    profile = "localstack"
  }
}
