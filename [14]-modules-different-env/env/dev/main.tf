provider "aws" {
    region = "us-east-1"
    profile = "dev"
}

module "vpc_creation" {
    source = "../../modules/vpc"
    cidr_block = "10.0.0.0/16"
    vpc_tag_name = "dev-vpc"
    
    pub_subnet_cidr_1 = "10.0.1.0/24"
    pub_subnet_az_1 =  "us-east-1a"
    
    pub_subnet_cidr_2 = "10.0.2.0/24"
    pub_subnet_az_2 =  "us-east-1b"
}

module "ec2_creation" {
    source = "../../modules/ec2"
    instance_type = "t2.micro"
    subnet_id = module.vpc_creation.subnet_id
    tags_name = "dev-ec2"
    ami_id = "ami-0cae6d6fe6048ca2c"
    associate_public_ip_address = true
}