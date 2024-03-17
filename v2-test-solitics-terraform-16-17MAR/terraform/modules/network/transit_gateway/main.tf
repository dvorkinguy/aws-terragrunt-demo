resource "aws_ec2_transit_gateway" "tgw" {
  description = var.description
  tags = {
    Name = var.name
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "tgw_vpc_attachment" {
  for_each = var.vpc_attachments

  vpc_id             = each.value.vpc_id
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  subnet_ids         = each.value.subnet_ids

  tags = {
    Name = "tgw-vpc-attachment-${each.key}"
  }
}

# Optionally, configure route tables for the transit gateway if needed
resource "aws_ec2_transit_gateway_route_table" "tgw_rt" {
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
}

resource "aws_ec2_transit_gateway_route_table_association" "tgw_rt_assoc" {
  for_each = var.vpc_attachments

  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.tgw_vpc_attachment[each.key].id
}
