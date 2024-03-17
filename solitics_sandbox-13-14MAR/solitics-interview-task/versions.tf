terraform {
  required_version = ">= 0.14" # Adjust according to your Terraform version

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0" # Adjust the version as needed
    }
  }
}
