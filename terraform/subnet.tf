# Subnet public
resource "aws_subnet" "subnet-cdap-public" {
  vpc_id     = aws_vpc.cdap2-vpc.id
  cidr_block = "172.198.0.16/28"
  map_public_ip_on_launch = "true"

  tags = {
    Name    = "subnet-cdap-public"
    Project = "infrastructure"
    Teams   = "bakary-elisee"
    Manage  = "terraform"
  }
}

# Subnet private
resource "aws_subnet" "subnet-cdap-private" {
  vpc_id     = aws_vpc.cdap2-vpc.id
  cidr_block = "172.198.0.0/28"

  tags = {
    Name    = "subnet-cdap-private"
    Project = "infrastructure"
    Teams   = "bakary-elisee"
    Manage  = "terraform"
  }
}
