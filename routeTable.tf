resource "aws_route_table" "wordpress_route_table" {
  vpc_id = aws_vpc.wordpress_vpc.id

  #route {
  #  cidr_block = "10.0.1.0/24"
  #  gateway_id = aws_internet_gateway.igateway.id
  #}

  #route {
  #  ipv6_cidr_block        = "::/0"
  #  egress_only_gateway_id = aws_egress_only_internet_gateway.igateway.id
  #}

  tags = {
    Name = "wordpress_route_table"
  }
}


resource "aws_route" "wordpress-route" {
    route_table_id = aws_route_table.wordpress_route_table.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igateway.id

    depends_on = [ aws_route_table.wordpress_route_table ]
}