provider "aws" {
  region = var.region_eu_west_1
  alias  = "eu-west-1"
}

provider "aws" {
  region = var.region_eu_west_2
  alias  = "eu-west-2"
}

resource "aws_vpc" "vpc_eu_west_1" {
  provider = aws.eu-west-1

  cidr_block           = var.cidr_block_eu_west_1
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "VPC in eu-west-1"
  }
}

resource "aws_vpc" "vpc_eu_west_2" {
  provider = aws.eu-west-2

  cidr_block           = var.cidr_block_eu_west_2
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "VPC in eu-west-2"
  }
}

module "vpc_eu_west_1" {
  source     = "./modules/network/vpc"
  providers  = { aws = aws.eu-west-1 }
  cidr_block = var.region_eu_west_1_cidr_block
}

module "vpc_eu_west_2" {
  source     = "./modules/network/vpc"
  providers  = { aws = aws.eu-west-2 }
  cidr_block = var.region_eu_west_2_cidr_block
}

module "eks" {
  source        = "./modules/compute/eks"
  cluster_name  = var.cluster_name
  subnet_ids    = module.vpc.public_subnet_ids
  # Other necessary inputs...
}

module "alb" {
  source              = "./modules/load_balancers"
  alb_security_groups = [module.vpc.alb_security_group_id]
  alb_subnets         = module.vpc.public_subnet_ids
  # Other necessary inputs...
}

