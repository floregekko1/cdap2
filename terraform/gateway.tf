resource "aws_internet_gateway" "internet-gateway" {
  vpc_id = aws_vpc.cdap2-vpc.id

  tags = {
    Name    = "internet-gateway"
    Project = "infrastructure"
    Teams   = "bakary-elisee"
    Manage  = "terraform"
  }
}