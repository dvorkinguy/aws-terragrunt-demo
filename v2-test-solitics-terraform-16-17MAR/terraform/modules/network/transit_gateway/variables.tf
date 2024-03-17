variable "description" {
  description = "The description of the Transit Gateway"
  type        = string
}

variable "name" {
  description = "The name tag of the Transit Gateway"
  type        = string
}

variable "vpc_attachments" {
  description = "A map of VPC attachments for the Transit Gateway. The key is an identifier for the attachment, and the value is an object with `vpc_id` and `subnet_ids` attributes."
  type = map(object({
    vpc_id     = string
    subnet_ids = list(string)
  }))
}
