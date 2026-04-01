provider "aws" {
    region = "us-east-1"
}

resource "aws_vpc" "vpc" {
    cidr_block = var.vpc_cidr_block
    tags = {
      Name = "Tofu-VPC"
    }
}

resource "aws_subnet" "public_subnet-1" {
    cidr_block = var.subenet_1_cidr
    vpc_id = aws_vpc.vpc.id
    availability_zone = "us-east-1a"
    tags = {
        Name = "Public-1"
    }
}
resource "aws_subnet" "public_subnet-2" {
    cidr_block = var.subenet_2_cidr
    vpc_id = aws_vpc.vpc.id
    availability_zone = "us-east-1b"
    tags = {
        Name = "Public-2"
    }
}

resource "aws_internet_gateway" "vpc_ig" {
    vpc_id = aws_vpc.vpc.id
    tags = {
      Name = "Tofu-IG"
    }
}

resource "aws_route_table" "public-rt" {
    vpc_id = aws_vpc.vpc.id
    route {
        gateway_id = aws_internet_gateway.vpc_ig.id
        cidr_block = "0.0.0.0/0"
    }
  
}

resource "aws_route_table_association" "public-rt_ass" {
    subnet_id = aws_subnet.public_subnet-1.id
    route_table_id = aws_route_table.public-rt.id
  
}

resource "aws_instance" "ec2" {
    subnet_id = aws_subnet.public_subnet-1.id
    ami = var.ami_id
    instance_type = var.instance_type
    tags = {
        Name = "Tofu-ec2"
    }
    associate_public_ip_address = var.associate_public_ip_address
  
}

module "ec2_instance" {
  source  = "https://github.com/terraform-aws-modules/terraform-aws-ec2-instance"

  name = "single-instance"

  instance_type = "t3.micro"
  key_name      = "user1"
  monitoring    = true
  subnet_id     = aws_subnet.public_subnet-1.id

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}