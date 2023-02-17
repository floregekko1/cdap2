#create a route table
resource "aws_route_table" "cdap2-route-private" {
  vpc_id = aws_vpc.cdap2-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.cdap2-nat-gateway.id
  }

  tags = {
    Name    = "cdap2-route-private"
    Project = "infrastructure"
    Teams   = "modibo-yve"
    Manage  = "terraform"
  }
}

#associate route table with subnet 
resource "aws_route_table_association" "cdap2-route-table-private" {
  subnet_id      = aws_subnet.subnet-cdap-private.id
  route_table_id = aws_route_table.cdap2-route-private.id
}