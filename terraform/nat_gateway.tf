resource "aws_nat_gateway" "nat-gateway" {
  allocation_id = aws_eip.ip-ngw.id
  subnet_id = aws_subnet.subnet-cdap-public.id

  tags = {
    Name    = "nat-gateway"
    Project = "infrastructure"
    Teams   = "bakary-elisee"
    Manage  = "terraform"
  }

  depends_on = [aws_internet_gateway.internet-gateway]
}