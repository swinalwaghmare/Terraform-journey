provider "aws" {
    region = "us-east-1"
    profile = "prod"
}

module "vpc_prod_creation" {
    source = "../../modules/vpc"
    cidr_block = var.vpc_cidr_block
    vpc_tag_name = "prod-vpc"

    pub_subnet_cidr_1 = var.public_subnet_1
    pub_subnet_az_1 = var.public_subnet_1_az

    pub_subnet_cidr_2 = var.public_subnet_2
    pub_subnet_az_2 = var.public_subnet_2_az
}

module "ec_prod_creation" {
    source = "../../modules/ec2"
    ami_id = var.ami_id
    instance_type = var.instance_type
    subnet_id = module.vpc_prod_creation.subnet_id
    tags_name = "prod-ec2"
    associate_public_ip_address = var.associate_public_ip_address
}