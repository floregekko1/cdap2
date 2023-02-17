# Internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.cdap2-vpc.id

  tags = {
    Name = "internet-gateway"
  }
}

# Route publique
resource "aws_route_table" "route-table-public" {
  vpc_id = aws_vpc.cdap2-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public-route"
  }
}