resource "aws_nat_gateway" "cdap2-nat-gateway" {
  allocation_id = aws_eip.cdap2-eip.id
  subnet_id     = aws_subnet.subnet-cdap-public.id

  tags = {
    Name    = "cdap2-public-nat-gateway"
    Project = "infrastructure"
    Teams   = "modibo-yve"
    Manage  = "terraform"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.gw-cdap]
}