
/*import {
  to = aws_key_pair.wp_key_pair
  id = "wp_key_pair"
  name = "wpKeyPair"
}*/



# Generate new private key for the EC2 instance
/*resource "tls_private_key" "wp_private_key" {
  algorithm = "RSA"
}*/

# Generate a key-pair with above key
/*resource "aws_key_pair" "wp_key_pair" {
  key_name   = "wpKeyPair"
  public_key = tls_private_key.wp_private_key.public_key_openssh
}*/



