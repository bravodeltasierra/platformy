terraform {
  backend "s3" {
    bucket         = "myapp-terraform-state-staging"
    key            = "staging/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-locks-staging"
    encrypt        = true
  }
}

