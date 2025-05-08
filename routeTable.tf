resource "aws_route_table" "wordpress_route_table" {
  vpc_id = aws_vpc.wordpress_vpc.id
  tags = {
    Name = "wordpress_route_table"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.wordpress_route_table.id
}


resource "aws_route" "wordpress_route" {
  route_table_id         = aws_route_table.wordpress_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.wordpress_igateway.id

  depends_on = [aws_route_table.wordpress_route_table]
}