resource "aws_nat_gateway" "nat-gateway" {
  subnet_id     = aws_subnet.subnet-cdap-public.id

  tags = {
    Name    = "nat-gateway"
    Project = "infrastructure"
    Teams   = "bakary-elisee"
    Manage  = "terraform"
  }

  depends_on = [aws_internet_gateway.internet-gateway]
}