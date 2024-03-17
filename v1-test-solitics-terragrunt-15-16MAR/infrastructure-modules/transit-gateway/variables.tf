variable "vpc_attachment_ids" {
  description = "List of VPC IDs to attach to the Transit Gateway"
  type        = list(string)
}

variable "subnet_ids" {
  description = "List of subnet IDs for each VPC attachment, used for routing"
  type        = list(list(string))
}
