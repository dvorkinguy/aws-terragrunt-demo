# Inside ./modules/load_balancers/outputs.tf

output "alb_dns_name" {
  value       = aws_lb.alb.dns_name
  description = "The DNS name of the ALB."
}

output "alb_arn" {
  value       = aws_lb.alb.arn
  description = "The ARN of the ALB."
}
