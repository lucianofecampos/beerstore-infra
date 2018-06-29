variable "cidr_default" {
  default = "192.168.0.0/16"
}

variable "cidr_public" {
  default = "192.168.128.0/24"
}

variable "cidr_private" {
  default = "192.168.10.0/24"
}

variable "availability_zones" {
  default = [
    "us-east-1a",
    "us-east-1b",
    "us-east-1c",
    "us-east-1d",
    "us-east-1e",
    "us-east-1f",
  ]
}

variable "my_public_cidr" {}

variable "aws_linux_ami" {
  default = "ami-b70554c8"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "db_password" {}
