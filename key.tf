# Generate new private key for the EC2 instance
/*resource "tls_private_key" "wp_private_key" {
  algorithm = "RSA"
}*/

# Generate a key-pair with above key
resource "aws_key_pair" "wp_key_pair" {
  key_name = "wpKeyPair"
  #public_key = tls_private_key.wp_private_key.public_key_openssh
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC/akHlegVBN43pfypycu9/CXvsd2XnDaU5XdgwdTSWnmDYqiyKmnzi6ocIGcjWynGJAzFTwz8UKl5rPnBBM7DnV1cBrTpmpeHAqdj+wLndHjLUMceLnr6MZgFqNKGftI57fKIoXfmtiH8/zikDAVrJ0dfpB2MQODy0eLIhRUiQNp2X2pngmX4CP7dh75H5dctli05jOc4SJC36snwMzZ4QHgOJ6L8A+JxpxV9ehv4eHFlyOLaw3+ygsgZyUSg8Bn/JqoHNaHxsNO4t4gs1DvxRs4U4eA2x5FUq5NsEQv1JApCBW5BYj6ziNuBVvMV1bHSHePv9tmb8+/DvVZ46jmPD"
}



