provider "aws" {
   region = "us-east-1"
}
#######################################################
#Creating UAT VPC with CIDR: 172.16.0.0/16
resource "aws_vpc" "uat_vpc" {
    cidr_block = "172.16.0.0/16" 
    tags = {
        Name = "TEST_VPC"
    }
}
output "uat_vpcid" {
  value = aws_vpc.uat_vpc.id
}
