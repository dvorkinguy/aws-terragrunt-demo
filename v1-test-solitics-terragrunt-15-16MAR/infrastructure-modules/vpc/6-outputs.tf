output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.this.id
}

output "public_subnet_ids" {
  description = "List of IDs of public subnets"
  value       = [for subnet in aws_subnet.public : subnet.id]
}

output "private_subnet_ids" {
  description = "List of IDs of private subnets"
  value       = [for subnet in aws_subnet.private : subnet.id]
}

# Assuming you have a security group dedicated for your ALB:
#output "alb_security_group_id" {
#  description = "The ID of the Security Group meant for the ALB"
#  value       = aws_security_group.alb.id
#}
