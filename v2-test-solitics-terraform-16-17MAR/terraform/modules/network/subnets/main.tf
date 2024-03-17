# Public Subnet in eu-west-1
resource "aws_subnet" "public_eu_west_1" {
  vpc_id            = var.vpc_id_eu_west_1
  cidr_block        = var.public_cidr_block_eu_west_1
  availability_zone = var.availability_zone_eu_west_1
  map_public_ip_on_launch = true
  tags = {
    Name = "Public Subnet in eu-west-1"
  }
}

# Private Subnet in eu-west-1
resource "aws_subnet" "private_eu_west_1" {
  vpc_id            = var.vpc_id_eu_west_1
  cidr_block        = var.private_cidr_block_eu_west_1
  availability_zone = var.availability_zone_eu_west_1
  tags = {
    Name = "Private Subnet in eu-west-1"
  }
}

# Public Subnet in eu-west-2
resource "aws_subnet" "public_eu_west_2" {
  vpc_id            = var.vpc_id_eu_west_2
  cidr_block        = var.public_cidr_block_eu_west_2
  availability_zone = var.availability_zone_eu_west_2
  map_public_ip_on_launch = true
  tags = {
    Name = "Public Subnet in eu-west-2"
  }
}

# Private Subnet in eu-west-2
resource "aws_subnet" "private_eu_west_2" {
  vpc_id            = var.vpc_id_eu_west_2
  cidr_block        = var.private_cidr_block_eu_west_2
  availability_zone = var.availability_zone_eu_west_2
  tags = {
    Name = "Private Subnet in eu-west-2"
  }
}
