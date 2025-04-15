resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.wordpress_vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Main"
  }
}