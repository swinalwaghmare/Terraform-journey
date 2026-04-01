variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
}

variable "public_subnet_1" {
  default = "10.0.1.0/24"  
}

variable "public_subnet_1_az" {
  default = "us-east-1a"  
}

variable "public_subnet_2" {
  default = "10.0.2.0/24"  
}

variable "public_subnet_2_az" {
  default = "us-east-1b"  
}

variable "ami_id" {
  default = "ami-0cae6d6fe6048ca2c"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "associate_public_ip_address" {
    default = true
    type = bool
}