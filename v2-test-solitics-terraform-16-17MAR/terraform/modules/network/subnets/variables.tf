variable "vpc_id_eu_west_1" {
  description = "The VPC ID for resources in eu-west-1."
  type        = string
}

variable "vpc_id_eu_west_2" {
  description = "The VPC ID for resources in eu-west-2."
  type        = string
}

variable "public_cidr_block_eu_west_1" {
  description = "The CIDR block for the public subnet in eu-west-1."
  type        = string
}

variable "private_cidr_block_eu_west_1" {
  description = "The CIDR block for the private subnet in eu-west-1."
  type        = string
}

variable "public_cidr_block_eu_west_2" {
  description = "The CIDR block for the public subnet in eu-west-2."
  type        = string
}

variable "private_cidr_block_eu_west_2" {
  description = "The CIDR block for the private subnet in eu-west-2."
  type        = string
}

variable "availability_zone_eu_west_1" {
  description = "The availability zone to use for resources in eu-west-1."
  type        = string
}

variable "availability_zone_eu_west_2" {
  description = "The availability zone to use for resources in eu-west-2."
  type        = string
}

variable "custom_policy_document" {
  description = "The JSON policy document for the custom IAM policy"
  type        = string
  # Example or default value can be provided or omitted
}

variable "vpc_id_eu_west_1" {}
variable "public_cidr_block_eu_west_1" {}
# And so on for each variable...
# End of test-solitics-v3/terraform/modules/network/subnets/variables.tf