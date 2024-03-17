variable "tgw_description" {
  description = "Description for the Transit Gateway"
}

provider "aws" {
  region = var.region
}

resource "aws_ec2_transit_gateway" "tgw" {
  description = var.tgw_description
}

