variable "vpc_cidr_block" {
  
} 

variable "subenet_1_cidr" {
  type = string
  default = ""
}

variable "subenet_2_cidr" {
  type = string
  default = ""
}

variable "ami_id" {
  
}

variable "instance_type" {
  
}

variable "associate_public_ip_address" {
    type = bool
    default = false
  
}