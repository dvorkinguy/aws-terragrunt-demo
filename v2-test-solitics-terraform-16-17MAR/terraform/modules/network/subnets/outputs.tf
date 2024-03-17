output "public_subnet_ids_eu_west_1" {
  value = module.subnets.public_subnet_ids_eu_west_1
}

output "private_subnet_ids_eu_west_1" {
  value = module.subnets.private_subnet_ids_eu_west_1
}

output "public_subnet_ids_eu_west_2" {
  value = module.subnets.public_subnet_ids_eu_west_2
}

output "private_subnet_ids_eu_west_2" {
  value = module.subnets.private_subnet_ids_eu_west_2
}

# In ./modules/network/subnets/outputs.tf

output "public_subnet_id_eu_west_1" {
  description = "The ID of the public subnet in eu-west-1"
  value       = aws_subnet.public_eu_west_1.id
}

output "private_subnet_id_eu_west_1" {
  description = "The ID of the private subnet in eu-west-1"
  value       = aws_subnet.private_eu_west_1.id
}

output "public_subnet_id_eu_west_2" {
  description = "The ID of the public subnet in eu-west-2"
  value       = aws_subnet.public_eu_west_2.id
}

output "private_subnet_id_eu_west_2" {
  description = "The ID of the private subnet in eu-west-2"
  value       = aws_subnet.private_eu_west_2.id
}