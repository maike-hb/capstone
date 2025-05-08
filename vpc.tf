# create a vpc with terraform
resource "aws_vpc" "wordpress_vpc" {
  cidr_block = var.cidr_block_vpc
  tags = {
    Name = "wordpress_vpc"
  }
}