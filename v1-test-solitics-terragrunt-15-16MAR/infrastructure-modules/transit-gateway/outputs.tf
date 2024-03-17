output "transit_gateway_id" {
  value       = aws_ec2_transit_gateway.tgw.id
  description = "The ID of the Transit Gateway."
}

output "transit_gateway_attachment_ids" {
  value       = aws_ec2_transit_gateway_vpc_attachment.tgw_attachment.*.id
  description = "The IDs of the Transit Gateway attachments."
}

output "transit_gateway_route_table_id" {
  value       = aws_ec2_transit_gateway_route_table.tgw_rt.id
  description = "The ID of the Transit Gateway route table."
}
