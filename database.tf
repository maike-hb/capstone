resource "aws_db_subnet_group" "mysql_subnet_group" {
  name       = "mysql_subnet_group"
  subnet_ids = [aws_subnet.private_subnet1.id, aws_subnet.private_subnet2.id]

  tags = {
    Name = "mysql_subnet_group"
  }
}


resource "aws_db_instance" "mysql_wordpress" {
  identifier              = "mysql-wordpress"
  engine                  = "mysql"
  instance_class          = "db.t3.micro"
  allocated_storage       = 20
  db_name                 = var.db_name
  username                = var.db_username
  password                = var.db_password
  port                    = var.db_port
  skip_final_snapshot     = true
  parameter_group_name    = "default.mysql8.0"
  multi_az                = false
  publicly_accessible     = false
  backup_retention_period = 0
  storage_type            = "gp2"
  storage_encrypted       = true
  db_subnet_group_name    = aws_db_subnet_group.mysql_subnet_group.name
  availability_zone       = var.az_1
  vpc_security_group_ids  = [aws_security_group.database_sg.id]
  tags = {
    Name = "mysql_wordpress"
  }
}
