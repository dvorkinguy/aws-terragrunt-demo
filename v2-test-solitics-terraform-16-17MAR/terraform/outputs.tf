output "vpc_eu_west_1_id" {
  description = "The ID of the VPC in the eu-west-1 region."
  value       = module.vpc_eu_west_1.vpc_id
}

output "vpc_eu_west_2_id" {
  description = "The ID of the VPC in the eu-west-2 region."
  value       = module.vpc_eu_west_2.vpc_id
}

output "iam_role_arn" {
  description = "The ARN of the IAM role created."
  value       = module.iam_example.role_arn
}

output "ec2_instance_ids" {
  description = "The IDs of the EC2 instances running Nginx."
  value       = module.ec2_nginx.instance_ids
}

output "alb_dns_name" {
  description = "The DNS name of the Application Load Balancer."
  value       = module.load_balancer.alb_dns_name
}

output "cloudfront_distribution_id" {
  description = "The ID of the CloudFront distribution."
  value       = module.cloudfront_distribution.cloudfront_distribution_id
}

output "cloudfront_distribution_domain" {
  description = "The domain name of the CloudFront distribution."
  value       = module.cloudfront_distribution.cloudfront_distribution_domain
}

output "logging_monitoring_cloudtrail_id" {
  description = "The ID of the CloudTrail trail."
  value       = module.logging_monitoring.cloudtrail_id
}

output "logging_monitoring_cloudwatch_log_group_name" {
  description = "The name of the CloudWatch Log Group."
  value       = module.logging_monitoring.cloudwatch_log_group_name
}

output "public_subnet_id_eu_west_1" {
  description = "The ID of the public subnet in eu-west-1."
  value       = module.subnets.public_subnet_id_eu_west_1
}

output "private_subnet_id_eu_west_1" {
  description = "The ID of the private subnet in eu-west-1."
  value       = module.subnets.private_subnet_id_eu_west_1
}
