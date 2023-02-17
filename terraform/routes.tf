# Elastic ip
resource "aws_eip" "cdap2-eip" {
  vpc      = true
}

# NAT gateway
resource "aws_nat_gateway" "cdap2-nat-gateway" {
  allocation_id = aws_eip.cdap2-eip.id
  subnet_id     = aws_subnet.subnet-cdap-public.id

  tags = {
    Name    = "gw-NAT"
    Project = "infrastructure"
    Teams   = "JB-beaura"
    Manage  = "terraform"
  }
}

# Internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.cdap2-vpc.id

  tags = {
    Name    = "internet-gateway"
    Project = "infrastructure"
    Teams   = "JB-beaura"
    Manage  = "terraform"
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
    Name    = "public-route"
    Project = "infrastructure"
    Teams   = "JB-beaura"
    Manage  = "terraform"
  }
}

# Private route
resource "aws_route_table" "route-table-private" {
  vpc_id = aws_vpc.cdap2-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.cdap2-nat-gateway.id
  }

  tags = {
    Name    = "public-route"
    Project = "infrastructure"
    Teams   = "JB-beaura"
    Manage  = "terraform"
  }
}