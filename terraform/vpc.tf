resource "aws_vpc" "cdap2-vpc" {
  cidr_block       = "172.198.0.0/24"

  tags = {
    Name    = "cdap2-vpc"
    Project = "infrastructure"
    Teams   = "jb-beaura"
    Manage  = "terraform"
  }
}