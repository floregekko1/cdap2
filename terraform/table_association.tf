resource "aws_route_table_association" "public" {
  subnet_id = aws_subnet.subnet-cdap-public.id
  route_table_id = aws_route_table.public-route-table.id
}

resource "aws_route_table_association" "private" {
  subnet_id = aws_subnet.subnet-cdap-private.id
  route_table_id = aws_route_table.private-route-table.id
}