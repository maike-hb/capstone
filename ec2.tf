resource "aws_instance" "wordpress_server" {
  ami                         = var.aws_ami
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.public_subnet.id
  vpc_security_group_ids      = [aws_security_group.wordpress_sg.id]
  key_name                    = aws_key_pair.wp_key_pair.key_name
  user_data                   = data.template_file.init.rendered
  tags = {
    Name = "wordpress_server"
  }
}

data "template_file" "init" {
  template = file("userData.sh")
  vars = {
    DB_NAME     = var.db_name
    DB_USER     = var.db_username
    DB_PASSWORD = var.db_password
    DB_HOST     = aws_db_instance.mysql_wordpress.address
  }
}


resource "aws_ec2_instance_state" "wordpress_server" {
  instance_id = aws_instance.wordpress_server.id
  #state       = "stopped"
  state = "running"
}
