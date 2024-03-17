variable "vpc_name" {
  description = "The name of the VPC"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
}

variable "vpc_azs" {
  description = "The availability zones for the VPC"
}

variable "private_subnets" {
  description = "The CIDR blocks for the private subnets"
}

variable "public_subnets" {
  description = "The CIDR blocks for the public subnets"
}

variable "enable_nat_gateway" {
  description = "Whether to create NAT gateways"
}

variable "single_nat_gateway" {
  description = "Whether to use a single NAT gateway"
}

variable "tags" {
  description = "Tags to apply to the resources"
}

variable "region" {
  description = "The AWS region"
}

provider "aws" {
  region = var.region
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 3.0"

  name               = var.vpc_name
  cidr               = var.vpc_cidr
  azs                = var.vpc_azs
  private_subnets    = var.private_subnets
  public_subnets     = var.public_subnets
  enable_nat_gateway = var.enable_nat_gateway
  single_nat_gateway = var.single_nat_gateway
  tags               = var.tags
}
