provider "aws" {
   region = "ap-southeast-2"
}
#######################################################
#Creating UAT VPC with CIDR: 172.16.0.0/16
resource "aws_vpc" "uat_vpc" {
    cidr_block = "172.16.0.0/16" 
    tags = {
        Name = "TEST-VPC"
    }
}
output "uat_vpcid" {
  value = aws_vpc.uat_vpc.id
}
######################
#creating uat public subnets with cidr 172.16.0.0/24
resource "aws_subnet" "uat_public_subnet" {
  vpc_id                  = "${aws_vpc.uat_vpc.id}"
  cidr_block              = "172.16.0.0/24"
  availability_zone       = "ap-southeast-2a"
  map_public_ip_on_launch = true
  tags = {
    Name        = "Test-public-subnet-1b"
  }
}
output "public_subnetid" {
  value = aws_subnet.uat_public_subnet.id
}
  #creating uat private subnets with cidr 172.16.1.0/24
resource "aws_subnet" "uat_private_subnet" {
  vpc_id                  = "${aws_vpc.uat_vpc.id}"
  cidr_block              = "172.16.1.0/24"
  availability_zone       = "ap-southeast-2b"
  map_public_ip_on_launch = true
  tags = {
    Name        = "Test-private-subnet-1b"
  }
}
output "private_subnetid" {
  value = aws_subnet.uat_private_subnet.id
}
resource "aws_internet_gateway" "uat_igw" {
    vpc_id                  = "${aws_vpc.uat_vpc.id}"
  tags = {
    "Name" = "Test_IGW"
  }
}
output "internet_gateway_id" {
    value = aws_internet_gateway.uat_igw.id
}
