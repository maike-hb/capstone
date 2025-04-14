# create a vpc with terraform
resource "aws_vpc" "wordpress_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "wordpress_vpc"
  }
}