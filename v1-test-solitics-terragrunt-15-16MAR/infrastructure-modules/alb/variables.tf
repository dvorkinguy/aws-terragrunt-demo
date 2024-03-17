variable "env" {
  description = "The deployment environment (e.g., dev, staging, prod)."
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID where the ALB will be deployed."
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs for the ALB."
  type        = list(string)
}

variable "alb_security_group_ids" {
  description = "List of security group IDs to attach to the ALB."
  type        = list(string)
}
