resource "aws_internet_gateway" "gw-cdap" {
  vpc_id = aws_vpc.cdap2-vpc.id

  tags = {
    Name    = "cdap2-gateway"
    Project = "infrastructure"
    Teams   = "modibo-yve"
    Manage  = "terraform"
  }
}