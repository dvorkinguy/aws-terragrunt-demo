output "transit_gateway_id" {
  value = aws_ec2_transit_gateway.tgw.id
  description = "The ID of the Transit Gateway"
}

output "transit_gateway_attachment_ids" {
  value = { for k, v in aws_ec2_transit_gateway_vpc_attachment.tgw_vpc_attachment : k => v.id }
  description = "The IDs of the VPC attachments to the Transit Gateway"
}
