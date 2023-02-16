resource "aws_route_table" "route-table" {
  vpc_id = aws_vpc.cdap2-vpc.id

  route {
    cidr_block = "10.0.1.0/24"
    gateway_id = aws_internet_gateway.internet-gateway.id
  }

  route {
    ipv6_cidr_block = "::/0"
  }

  tags = {
    Name    = "route-table"
    Project = "infrastructure"
    Teams   = "bakary-elisee"
    Manage  = "terraform"
  }
}