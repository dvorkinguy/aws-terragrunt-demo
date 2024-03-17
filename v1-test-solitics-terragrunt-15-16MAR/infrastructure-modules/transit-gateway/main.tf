resource "aws_ec2_transit_gateway" "tgw" {
  description = "Transit Gateway for interconnecting VPCs"

  tags = {
    Name = "Main-Transit-Gateway"
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "tgw_attachment" {
  count = length(var.vpc_attachment_ids)

  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  vpc_id             = var.vpc_attachment_ids[count.index]
  subnet_ids         = [var.subnet_ids[count.index]]

  tags = {
    Name = "TGW-Attachment-${count.index}"
  }
}

resource "aws_ec2_transit_gateway_route_table" "tgw_rt" {
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id

  tags = {
    Name = "Main-Route-Table"
  }
}

resource "aws_ec2_transit_gateway_route_table_association" "tgw_rt_assoc" {
  count = length(var.vpc_attachment_ids)

  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.tgw_attachment[count.index].id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt.id
}
