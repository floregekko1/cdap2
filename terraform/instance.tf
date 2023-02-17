# bastion public
resource "aws_instance" "bastion-public" {
  ami = "ami-06e0ce9d3339cb039"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.subnet-cdap-public.id

  tags = {
    Name    = "bastion-public"
    Project = "infrastructure"
    Teams   = "bakary-elisee"
    Manage  = "terraform"
  }
}

# instance private
resource "aws_instance" "instance-private" {
  ami = "ami-06e0ce9d3339cb039"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.subnet-cdap-private.id

  tags = {
    Name    = "instance-private"
    Project = "infrastructure"
    Teams   = "bakary-elisee"
    Manage  = "terraform"
  }
}