output "vpc_id_eu_west_1" {
  description = "The ID of the VPC in eu-west-1"
  value       = aws_vpc.vpc_eu_west_1.id
}

output "vpc_id_eu_west_2" {
  description = "The ID of the VPC in eu-west-2"
  value       = aws_vpc.vpc_eu_west_2.id
}

output "public_subnet_ids" {
  value = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]
}

output "alb_security_group_id" {
  value = aws_security_group.alb_sg.id
}