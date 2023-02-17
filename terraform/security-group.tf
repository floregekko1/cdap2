resource "aws_security_group" "cdap2-security-group" {
  name        = "cdap2-security-group"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.cdap2-vpc.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "cdap2-security-group"
    Project = "infrastructure"
    Teams   = "modibo-yve"
    Manage  = "terraform"
  }
}