variable "alb_dns_name" {
  description = "The DNS name of the ALB"
  type        = string
}

variable "waf_web_acl_id" {
  description = "The ID of the WAF Web ACL to associate with the CloudFront distribution"
  type        = string
}

variable "env" {
  description = "The environment (e.g., dev, staging, prod) for tagging"
  type        = string
}
