resource "aws_security_group" "wordpress_sg" {
  name        = "wordpress_sg"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.wordpress_vpc.id

  tags = {
    Name = "wordpress_sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "http_ingress" {
  security_group_id = aws_security_group.wordpress_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "ssh_ingress" {
  security_group_id = aws_security_group.wordpress_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
}


resource "aws_vpc_security_group_egress_rule" "all_egress" {
  security_group_id = aws_security_group.wordpress_sg.id
  ip_protocol       = "-1"
  cidr_ipv4         = "0.0.0.0/0"
}