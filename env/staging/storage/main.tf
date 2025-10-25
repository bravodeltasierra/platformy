terraform {
  required_version = ">= 1.6.0"
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
  
  default_tags {
    tags = {
      Environment = "staging"
      ManagedBy   = "OpenTofu"
      Project     = var.project_name
    }
  }
}

module "networking" {
  source = "../../modules/networking"

  environment           = "dev"
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones   = var.availability_zones
  
  tags = {
    CostCenter = "development"
  }
}

module "storage" {
  source = "../../modules/storage"

  bucket_name          = "${var.project_name}-dev-data"
  versioning_enabled   = false  # Less strict for dev
  block_public_access  = true
  
  tags = {
    CostCenter = "development"
  }
}
