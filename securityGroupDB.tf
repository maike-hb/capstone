resource "aws_security_group" "database_sg" {
  name        = "database_sg"
  description = "Security group for MySQL database"
  vpc_id      = aws_vpc.wordpress_vpc.id

  tags = {
    Name = "database_sg"
  }
}


resource "aws_vpc_security_group_ingress_rule" "db_ingress" {
  security_group_id            = aws_security_group.database_sg.id
  referenced_security_group_id = aws_security_group.wordpress_sg.id
  #cidr_ipv4         = "0.0.0.0/0"
  from_port   = var.db_port
  ip_protocol = "tcp"
  to_port     = var.db_port
  description = "Allow MySQL inbound traffic from WordPress server"
}


resource "aws_vpc_security_group_egress_rule" "db_egress" {
  security_group_id = aws_security_group.database_sg.id
  ip_protocol       = "-1"
  cidr_ipv4         = "0.0.0.0/0"
  description       = "Allow all outbound traffic"
}

