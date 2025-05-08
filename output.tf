output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.wordpress_server.public_ip
}

output "db_address" {
  value       = aws_db_instance.mysql_wordpress.address
  description = "Connect to the database at this endpoint"
}

output "db_port" {
  value       = aws_db_instance.mysql_wordpress.port
  description = "The port the database is listening on"
}

/*output "privateKey" {
  value       = tls_private_key.wp_private_key.private_key_pem
  description = "The private key for the EC2 instance"
  sensitive   = true
}*/

output "publicKey" {
  value       = aws_key_pair.wp_key_pair.public_key
  description = "The public key for the EC2 instance"
  sensitive   = true
}
