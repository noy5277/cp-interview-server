terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket       = "hello-world-crossplane-demo"
    key          = "terraform.tfstate"
    region       = "eu-west-1"
    use_lockfile = true
  }
}


provider "aws" {
  region = var.aws_region
  default_tags {
    tags = {
      TFC_Workspace_Name = "${var.s3-backend-name}"
    }
  }
}
