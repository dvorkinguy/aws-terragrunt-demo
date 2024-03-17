resource "aws_eip" "nat" {
  for_each = toset(var.public_subnet_ids)

  vpc = true
}

resource "aws_nat_gateway" "nat" {
  for_each     = toset(var.public_subnet_ids)
  allocation_id = aws_eip.nat[each.key].id
  subnet_id      = each.value
  connectivity_type = "public"

  tags = {
    Name = "NATGateway-${each.key}"
  }
}
