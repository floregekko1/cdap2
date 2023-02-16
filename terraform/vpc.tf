resource "aws_vpc" "cdap2-vpc" {
  cidr_block       = "172.198.0.0/24"

  tags = {
    Name    = "cdap2-vpc"
    Project = "infrastructure"
    Teams   = "jb-beaura"
    Manage  = "terraform"
  }
}

# Subnet public
resource "aws_subnet" "subnet-cdap-public" {
  vpc_id     = aws_vpc.cdap2-vpc.id
  cidr_block = "172.198.0.16/28"

  tags = {
    Name    = "subnet-cdap2-public"
    Project = "infrastructure"
    Teams   = "JB-beaura"
    Manage  = "terraform"
  }
}

# Subnet private
resource "aws_subnet" "subnet-cdap-private" {
  vpc_id     = aws_vpc.cdap2-vpc.id
  cidr_block = "172.198.0.0/28"

  tags = {
    Name    = "subnet-cdap2-private"
    Project = "infrastructure"
    Teams   = "JB-beaura"
    Manage  = "terraform"
  }
}