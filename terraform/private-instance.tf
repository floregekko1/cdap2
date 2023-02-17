# Private instance
resource "aws_instance" "this" {
  ami                     = "ami-09ee0944866c73f62"
  instance_type           = "t2.micro"
  subnet_id               = aws_subnet.subnet-cdap-private.id
  vpc_security_group_ids  = [aws_security_group.security-group.id]
  key_name = "key-bo"
}