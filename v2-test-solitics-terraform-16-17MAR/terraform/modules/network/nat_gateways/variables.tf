variable "public_subnet_ids" {
  description = "The IDs of the public subnets where NAT Gateways will be created"
  type        = list(string)
}
