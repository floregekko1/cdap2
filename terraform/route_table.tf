# route table public
resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.cdap2-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet-gateway.id
  }

  tags = {
    Name    = "public-route-table"
    Project = "infrastructure"
    Teams   = "bakary-elisee"
    Manage  = "terraform"
  }
}

# route table private
resource "aws_route_table" "private-route-table" {
  vpc_id = aws_vpc.cdap2-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-gateway.id
  }

  tags = {
    Name    = "private-route-table"
    Project = "infrastructure"
    Teams   = "bakary-elisee"
    Manage  = "terraform"
  }
}