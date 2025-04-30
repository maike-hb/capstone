resource "aws_instance" "wordpress_server" {
  # us-west-2
  ami = "ami-05572e392e80aee89"
  # eu-central-1
  # ami           = "ami-0d8d11821a1c1678b"
  instance_type = "t2.micro"
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.public_subnet.id
  vpc_security_group_ids      = [aws_security_group.wordpress_sg.id]
  #availability_zone = "us-west-2a"
  key_name = "vockey"
  user_data = file("userData.sh")
  tags = {
    Name = "wordpress_server"
  }
}