terraform {
  backend "s3" {
    bucket  = "staging-terraform-state-12093"
    key     = "staging/terraform.tfstate"
    region  = "us-east-2"
    encrypt = true
  }
}

