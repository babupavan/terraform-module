provider "aws" {
  region = var.example.region
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_vpc" "my-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "myvpc1"
  }
}

resource "aws_subnet" "public-subnet" {
  cidr_block = "10.0.0.0/28"
  vpc_id = aws_vpc.my-vpc.id
  availability_zone = "ap-south-1a"
  tags = {
    Name = "pub-sub"
  }
}

resource "aws_internet_gateway" "my-igw" {
 vpc_id =  aws_vpc.my-vpc.id
}

resource "aws_route_table" "my-rt" {
 vpc_id = aws_vpc.my-vpc.id

 route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my-igw.id
 } 
}

resource "aws_route_table_association" "my-rta" {
    subnet_id = aws_subnet.public-subnet.id
    route_table_id = aws_route_table.my-rt.id  
}

resource "aws_instance" "ec2" {
    ami = var.ami-value
    instance_type = var.instance_type
    subnet_id = aws_subnet.public-subnet.id
    key_name = var.example.key_name
    associate_public_ip_address = true
    tags = {
      Name = "my-ec2"
    }
}