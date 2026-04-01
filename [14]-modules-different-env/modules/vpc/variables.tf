variable "cidr_block" {
    type = string
    default = ""
    description = "VPC cidr block"
}

variable "vpc_tag_name" {
    type = string
    default = ""
    description = "VPC tag name"
}

variable "pub_subnet_cidr_1" {
    type = string
    default = ""
    description = "Subnet 1 cidr block"
}

variable "pub_subnet_az_1" {
  
}

variable "pub_subnet_az_2" {
  
}

variable "pub_subnet_cidr_2" {
    type = string
    default = ""
    description = "Subnet 2 cidr block"
}
