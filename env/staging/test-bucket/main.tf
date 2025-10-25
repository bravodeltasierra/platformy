terraform {
  required_version = ">= 1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket  = "staging-terraform-state-12093"
    key     = "test-bucket/terraform.tfstate"
    region  = "us-east-2"
    encrypt = true
  }

}

provider "aws" {
  region = "us-east-2"
  default_tags {
    tags = {
      Environment = "staging"
      ManagedBy   = "OpenTofu"
    }
  }
}

module "test_bucket" {
  source = "../../../modules/test-bucket"

  bucket_name = "new-bucket-1231dsfdsjfdjs"
}
