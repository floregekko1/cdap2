#create a public subnet
resource "aws_subnet" "subnet-cdap-public" {
  vpc_id     = aws_vpc.cdap2-vpc.id
  cidr_block = "172.198.0.0/28"

 tags = {
    Name    = "cdap2-subnet-public"
    Project = "infrastructure"
    Teams   = "modibo-yve"
    Manage  = "terraform"
  }
}

#create a private subnet
resource "aws_subnet" "subnet-cdap-private" {
  vpc_id     = aws_vpc.cdap2-vpc.id
  cidr_block = "172.198.0.16/28"

  tags = {
    Name    = "cdap2-subnet-private"
    Project = "infrastructure"
    Teams   = "modibo-yve"
    Manage  = "terraform"
  }
}