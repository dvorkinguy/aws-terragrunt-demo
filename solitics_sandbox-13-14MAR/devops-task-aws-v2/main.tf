provider "aws" {
  region = "eu-west-1" # Default region; can be overridden in module calls
}

module "vpc_eu_west_1" {
  source = "./vpc_module"

  vpc_name           = "eu-west-1-vpc"
  vpc_cidr           = "10.0.0.0/16"
  vpc_azs            = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  private_subnets    = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets     = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
  enable_nat_gateway = true
  single_nat_gateway = true
  tags               = { "Environment" = "Development" }
  region             = "eu-west-1"
}

module "vpc_eu_west_2" {
  source = "./vpc_module"

  vpc_name           = "eu-west-2-vpc"
  vpc_cidr           = "10.1.0.0/16"
  vpc_azs            = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
  private_subnets    = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24"]
  public_subnets     = ["10.1.101.0/24", "10.1.102.0/24", "10.1.103.0/24"]
  enable_nat_gateway = true
  single_nat_gateway = true
  tags               = { "Environment" = "Development" }
  region             = "eu-west-2"
}

module "transit_gateway" {
  source = "./transit_gateway_module"

  tgw_description = "Transit Gateway connecting eu-west-1 and eu-west-2"
}

module "tgw_attachments_eu_west_1" {
  source = "./transit_gateway_module"

  tgw_id     = module.transit_gateway.tgw_id
  vpc_id     = module.vpc_eu_west_1.vpc_id
  subnet_ids = module.vpc_eu_west_1.public_subnets
}

module "tgw_attachments_eu_west_2" {
  source = "./transit_gateway_module"

  tgw_id     = module.transit_gateway.tgw_id
  vpc_id     = module.vpc_eu_west_2.vpc_id
  subnet_ids = module.vpc_eu_west_2.public_subnets
}
