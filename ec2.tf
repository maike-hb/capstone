resource "aws_instance" "wordpress_server" {
  ami                         = var.aws_ami
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.public_subnet.id
  vpc_security_group_ids      = [aws_security_group.wordpress_sg.id]
  #availability_zone = "us-west-2a"
  key_name  = aws_key_pair.wp_key_pair.key_name
  user_data = file("userData.sh")
  tags = {
    Name = "wordpress_server"
  }
}
