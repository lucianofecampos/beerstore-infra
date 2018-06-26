variable "cidr_default" {
  default = "192.168.0.0/16"
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
