variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "internet_gateway_id" {
  description = "The ID of the Internet Gateway for the VPC"
  type        = string
}

variable "public_subnet_ids" {
  description = "A map of public subnet IDs to associate with the public route table"
  type        = map(string)
}

variable "private_subnet_ids" {
  description = "A map of private subnet IDs to associate with the private route table"
  type        = map(string)
}

variable "destination_cidr_block" {
  description = "The CIDR block for the destination route in the private route table"
  type        = string
  default     = "0.0.0.0/0"
}

variable "transit_gateway_id" {
  description = "The ID of the Transit Gateway"
  type        = string
  default     = ""
}
