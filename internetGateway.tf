resource "aws_internet_gateway" "wordpress_igateway" {
  vpc_id = aws_vpc.wordpress_vpc.id

  tags = {
    Name = "wordpress_igateway"
  }
}
