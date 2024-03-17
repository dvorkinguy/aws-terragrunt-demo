output "alb_arn" {
  description = "The ARN of the ALB."
  value       = aws_lb.alb.arn
}

output "alb_dns_name" {
  description = "The DNS name of the ALB."
  value       = aws_lb.this.dns_name
}

output "target_group_arn" {
  description = "The ARN of the target group associated with the ALB."
  value       = aws_lb_target_group.tg.arn
}


output "alb_zone_id" {
  value = aws_lb.alb.zone_id
}

output "listener_arns" {
  value = [aws_lb_listener.front_end.arn]
}