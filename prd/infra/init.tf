provider "aws" {
  region = local.region
}

terraform {
  required_version = ">= 1.1.4"

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 4.0.0"
    }
  }
}