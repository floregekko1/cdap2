resource "aws_internet_gateway" "cdap2-vpc" {
  vpc_id = aws_vpc.cdap2-vpc.id

  tags = {
    Name    = "cdap2-vpc"
    Project = "infrastructure"
    Teams   = "bakary-elisee"
    Manage  = "terraform"
  }
}