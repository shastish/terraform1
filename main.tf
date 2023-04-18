provider "aws" {
   region = "ap-south-1"
}
#######################################################
#Creating UAT VPC with CIDR: 172.16.0.0/16
resource "aws_vpc" "uat_vpc" {
    cidr_block = "172.16.0.0/16" 
    tags = {
        Name = "test-vpc"
    }
}
output "uat_vpcid" {
  value = aws_vpc.uat_vpc.id
}
