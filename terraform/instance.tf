# create a public bastion
resource "aws_instance" "cdap2-public-bastion_instance" {
  ami = "ami-0ca5ef73451e16dc1"
  instance_type = "t2.micro"
  key_name = "key-pair-yve"
  subnet_id = aws_subnet.subnet-cdap-public.id
  vpc_security_group_ids = [aws_security_group.cdap2-security-group.id]
  tags = {
    Name    = "cdap2-public-bastion_instance"
    Project = "infrastructure"
    Teams   = "modibo-yve"
    Manage  = "terraform"
  }
}

#create a private instance
resource "aws_instance" "cdap2-private-instance" {
  ami = "ami-0ca5ef73451e16dc1"
  instance_type = "t2.micro"
  key_name = "key-pair-yve"
  subnet_id = aws_subnet.subnet-cdap-private.id
  vpc_security_group_ids = [aws_security_group.cdap2-security-group.id]
  tags = {
    Name    = "cdap2-private-instance"
    Project = "infrastructure"
    Teams   = "modibo-yve"
    Manage  = "terraform"
  }
}