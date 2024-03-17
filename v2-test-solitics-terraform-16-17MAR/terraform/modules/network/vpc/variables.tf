variable "cidr_block_eu_west_1" {
  description = "CIDR block for the VPC in eu-west-1"
  type        = string
}

variable "cidr_block_eu_west_2" {
  description = "CIDR block for the VPC in eu-west-2"
  type        = string
}

variable "region_eu_west_2" {
  description = "The AWS region for eu-west-2 resources"
  default     = "eu-west-2"
}

variable "region_eu_west_1" {
  description = "The AWS region for eu-west-1 resources"
  default     = "eu-west-1"
}