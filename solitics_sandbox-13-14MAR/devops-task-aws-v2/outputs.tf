output "vpc_eu_west_1_id" {
  description = "The ID of the VPC in eu-west-1"
  value       = module.vpc_eu_west_1.vpc_id
}

output "vpc_eu_west_2_id" {
  description = "The ID of the VPC in eu-west-2"
  value       = module.vpc_eu_west_2.vpc_id
}

output "transit_gateway_id" {
  description = "The ID of the Transit Gateway"
  value       = aws_ec2_transit_gateway.tgw.id
}
