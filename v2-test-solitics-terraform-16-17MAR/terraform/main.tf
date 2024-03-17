terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
  alias  = "eu-west-1"
}

provider "aws" {
  region = "eu-west-2"
  alias  = "eu-west-2"
}

# VPC resources for eu-west-1
resource "aws_vpc" "vpc_eu_west_1" {
  provider = aws.eu-west-1
  cidr_block           = var.region_eu_west_1_cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "VPC in eu-west-1"
  }
}

# VPC resources for eu-west-2
resource "aws_vpc" "vpc_eu_west_2" {
  provider = aws.eu-west-2
  cidr_block           = var.region_eu_west_2_cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "VPC in eu-west-2"
  }
}

module "eks" {
  source          = "./modules/compute/eks"
  cluster_name    = var.cluster_name
  subnet_ids      = module.vpc_eu_west_2.subnet_ids
  eks_version     = var.eks_version
  node_group_name = var.node_group_name
  node_desired_size = var.node_desired_size
  node_max_size    = var.node_max_size
  node_min_size    = var.node_min_size
  providers       = { aws = aws.eu-west-2 }
}

module "alb" {
  source               = "./modules/load_balancers/alb"
  vpc_id               = module.vpc_eu_west_1.vpc_id
  subnets              = module.vpc_eu_west_1.public_subnets
  providers            = { aws = aws.eu-west-1 }
}

module "ec2_instances" {
  source               = "./modules/compute/ec2"
  ami                  = var.ami_id
  instance_type        = var.instance_type
  subnet_id            = module.subnets.public_subnet_id_eu_west_1
  key_name             = var.key_name
  security_group_ids   = module.alb.security_group_ids
  iam_instance_profile = var.iam_instance_profile_arn
}



module "cloudfront_distribution" {
  source       = "./modules/cloudfront"
  alb_dns_name = module.alb.dns_name
}

module "logging_monitoring" {
  source                  = "./modules/logging_monitoring"
  cloudtrail_name         = var.cloudtrail_name
  s3_bucket_name          = var.s3_bucket_name
  cloudwatch_log_group_name = var.cloudwatch_log_group_name
  metric_filter_name      = var.metric_filter_name
  metric_filter_pattern   = var.metric_filter_pattern
  subscription_filter_name = var.subscription_filter_name
  subscription_filter_pattern = var.subscription_filter_pattern
  sns_topic_name          = var.sns_topic_name
  metric_alarm_name       = var.metric_alarm_name
}

module "subnets" {
  source = "./modules/network/subnets"

  vpc_id_eu_west_1 = aws_vpc.vpc_eu_west_1.id
  public_cidr_block_eu_west_1 = "10.0.1.0/24"
  private_cidr_block_eu_west_1 = "10.0.2.0/24"
  availability_zone_eu_west_1 = "eu-west-1a"

  vpc_id_eu_west_2 = aws_vpc.vpc_eu_west_2.id
  public_cidr_block_eu_west_2 = "10.1.1.0/24"
  private_cidr_block_eu_west_2 = "10.1.2.0/24"
  availability_zone_eu_west_2 = "eu-west-2a"
}

module "iam_roles" {
  source                  = "./modules/security/iam"
  eks_node_role_name      = "eks-node-role"
  eks_cluster_role_name   = "eks-cluster-role"
  custom_role_name        = "solitics-example_role"
  custom_policy_name      = "solitics-example_policy"
  custom_policy_document  = "var.custom_policy_document"
  s3_bucket_for_policy    = "solitics-example-bucket"
}

module "nacls" {
  source   = "./modules/security/nacls"
  vpc_id   = module.vpc_eu_west_1.vpc_id
}
