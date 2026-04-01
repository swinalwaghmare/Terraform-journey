variable "ami_id" {}
variable "instance_type" {}
variable "subnet_id" {}
variable "associate_public_ip_address" {
    type = bool
    default = false
}
variable "tags_name" {}