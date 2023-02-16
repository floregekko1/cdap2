resource "aws_nat_gateway" "nat-gateway" {
  subnet_id     = aws_subnet.subnet-cdap-public.id

  tags = {
    Name    = "nat-gateway"
    Project = "infrastructure"
    Teams   = "bakary-elisee"
    Manage  = "terraform"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.internet-gateway]
}