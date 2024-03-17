resource "aws_network_acl" "example" {
  vpc_id = var.vpc_id

  tags = {
    Name = "example-nacl"
  }
}

resource "aws_network_acl_rule" "ingress_http" {
  network_acl_id = aws_network_acl.example.id
  rule_number    = 100
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 80
  to_port        = 80
}

resource "aws_network_acl_rule" "egress_http" {
  network_acl_id = aws_network_acl.example.id
  rule_number    = 100
  egress         = true
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 80
  to_port        = 80
}

# Add more rules as needed, incrementing the rule_number for each
