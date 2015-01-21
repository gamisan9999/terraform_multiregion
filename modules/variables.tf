# Variables
# terraform.tfvars
variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_keypair" {}

variable "region" {
  default = "ap-northeast-1"
}

variable "address_prefix" {
  default = { 
    ap-northeast-1 = "172.16"
    us-east-1 = "172.17"
    eu-west-1 = "172.18"
  }
}

# Amazon Machine Image variables 
#########################################################################
variable "nat_amis"{
  default = {
    ap-northeast-1 = "ami-68ebfb69"  # NAT AMI HVM
    us-east-1 = "ami-a6ec88ce"
    eu-west-1 = ""
  }
}
