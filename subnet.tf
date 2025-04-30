resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.wordpress_vpc.id
  cidr_block              = var.cidr_block_public_subnet
  availability_zone       = var.az_1
  map_public_ip_on_launch = true
  tags = {
    Name = "public_subnet"
  }
}

resource "aws_subnet" "private_subnet1" {
  vpc_id            = aws_vpc.wordpress_vpc.id
  cidr_block        = var.cidr_block_private_subnet1
  availability_zone = var.az_1
  tags = {
    Name = "private_subnet1"
  }
}

resource "aws_subnet" "private_subnet2" {
  vpc_id            = aws_vpc.wordpress_vpc.id
  cidr_block        = var.cidr_block_private_subnet2
  availability_zone = var.az_2
  tags = {
    Name = "private_subnet2"
  }
}