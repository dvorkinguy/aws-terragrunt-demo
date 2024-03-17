variable "tgw_id" {
  description = "ID of the Transit Gateway"
}

variable "vpc_id" {
  description = "ID of the VPC to attach"
}

variable "subnet_ids" {
  description = "Subnet IDs to associate with the attachment"
}

provider "aws" {
  region = var.region
}

module "tgw_attachment" {
  source  = "terraform-aws-modules/transit-gateway/aws//modules/transit-gateway-vpc-attachment"
  version = "~> 2.0"

  transit_gateway_id = var.tgw_id
  vpc_id             = var.vpc_id
  subnet_ids         = var.subnet_ids
}
