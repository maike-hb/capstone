resource "aws_internet_gateway" "igateway" {
  vpc_id = aws_vpc.wordpress_vpc.id

  tags = {
    Name = "igateway"
  }
}