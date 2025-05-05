variable "aws_ami" {
  description = "The AMI ID to use for the EC2 instance"
  type        = string
  default     = "ami-009082a6cd90ccd0e"

  # us-west-2
  # ami = "ami-05572e392e80aee89"
  # eu-north-1
  # ami           = "ami-0dd574ef87b79ac6c"
  # eu-central-1
  # ami-009082a6cd90ccd0e
}

# cidr settings
variable "cidr_block_vpc" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "cidr_block_public_subnet" {
  description = "The CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "cidr_block_private_subnet1" {
  description = "The CIDR block for the private_subnet1"
  type        = string
  default     = "10.0.2.0/24"
}

variable "cidr_block_private_subnet2" {
  description = "The CIDR block for the private_subnet2"
  type        = string
  default     = "10.0.3.0/24"
}


# database settings
variable "db_username" {
  description = "The username for the database"
  type        = string
  sensitive   = true
  default     = "admin"
}

variable "db_password" {
  description = "The password for the database"
  type        = string
  sensitive   = true
  default     = "admin123"
}

variable "db_name" {
  description = "The name to use for the database"
  type        = string
  default     = "wordpress_db"
}

variable "db_port" {
  description = "The port to use for the database"
  type        = number
  default     = 3306
}

# region settings
variable "region" {
  description = "The AWS region to use for the RDS instance"
  type        = string
  #default     = "us-west-2"
  default = "eu-central-1"
}

variable "az_1" {
  description = "The first availability zone to use for the RDS instance"
  type        = string
  #default     = "us-west-2a"
  default = "eu-central-1a"
}

variable "az_2" {
  description = "The second availability zone to use for the RDS instance"
  type        = string
  #default     = "us-west-2b"
  default = "eu-central-1b"
}

