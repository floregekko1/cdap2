#create a route table
resource "aws_route_table" "cdap2-route-public" {
  vpc_id = aws_vpc.cdap2-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw-cdap.id
  }

  tags = {
    Name    = "cdap2-route-public"
    Project = "infrastructure"
    Teams   = "modibo-yve"
    Manage  = "terraform"
  }
}

#associate route table with subnet 
resource "aws_route_table_association" "cdap2-route-table-public" {
  subnet_id      = aws_subnet.subnet-cdap-public.id
  route_table_id = aws_route_table.cdap2-route-public.id
}