# AWS Network Visibility Dashboard - Dev Environment

terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "../../modules/vpc"

  vpc_cidr     = var.vpc_cidr
  project_name = var.project_name
  environment  = var.environment
}

module "security_groups" {
  source = "../../modules/security_groups"

  vpc_id       = module.vpc.vpc_id
  project_name = var.project_name
  environment  = var.environment
}