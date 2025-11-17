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

module "ec2" {
  source = "../../modules/ec2"

  subnet_id         = module.vpc.public_subnet_ids[0]  # 最初のPublic Subnet
  security_group_id = module.security_groups.ec2_security_group_id
  project_name      = var.project_name
  environment       = var.environment
  instance_type     = "t2.micro"
}

module "alb" {
  source = "../../modules/alb"

  vpc_id                = module.vpc.vpc_id
  public_subnet_ids     = module.vpc.public_subnet_ids
  alb_security_group_id = module.security_groups.alb_security_group_id
  ec2_instance_ids      = [module.ec2.instance_id]

  project_name = var.project_name
  environment  = var.environment
}