# Inside ./modules/load_balancers/variables.tf

variable "alb_security_groups" {
  description = "A list of security group IDs to assign to the ALB."
  type        = list(string)
}

variable "alb_subnets" {
  description = "A list of subnet IDs for the ALB."
  type        = list(string)
}

variable "vpc_id" {
  description = "The VPC ID where the target groups and ALB are created."
  type        = string
}
