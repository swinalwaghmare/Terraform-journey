resource "aws_vpc" "vpc" {
    cidr_block = var.cidr_block

    tags = {
      Name = var.vpc_tag_name
      }
    }
  

resource "aws_internet_gateway" "vpc_ig" {
    vpc_id = aws_vpc.vpc.id
    tags = {
      Name = "${var.vpc_tag_name}_IG"
    }
}

resource "aws_route_table" "public-rt" {
    vpc_id = aws_vpc.vpc.id

    route {
        gateway_id = aws_internet_gateway.vpc_ig.id
        cidr_block = "0.0.0.0/0"
    }
    tags = {
      Name = "Public-RT"
    }
}

resource "aws_route_table_association" "public-rt-ass-1" {

    route_table_id = aws_route_table.public-rt.id
    subnet_id = aws_subnet.public-1.id
  
}
resource "aws_route_table_association" "public-rt-ass-2" {

    route_table_id = aws_route_table.public-rt.id
    subnet_id = aws_subnet.public-2.id
  
}

resource "aws_subnet" "public-1" {
    cidr_block = var.pub_subnet_cidr_1
    vpc_id = aws_vpc.vpc.id
    availability_zone = var.pub_subnet_az_1
    tags = {
      Name = "Public-1"
    }
}

resource "aws_subnet" "public-2" {
    cidr_block = var.pub_subnet_cidr_2
    vpc_id = aws_vpc.vpc.id
    availability_zone = var.pub_subnet_az_2
    tags = {
      Name = "Public-2"
    }
}

