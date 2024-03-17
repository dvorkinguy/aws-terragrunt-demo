terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
    // Include any other providers you're using here
  }
}

provider "aws" {
  region = var.aws_region_eu_west_1
  alias  = "new-alias-1"
}

provider "aws" {
  region = var.aws_region_eu_west_2
  alias  = "new-alias-2"
}

# Kubernetes provider configuration
# Make sure to define it according to your needs
# Example:
# provider "kubernetes" {
#   # Your configuration here
# }
