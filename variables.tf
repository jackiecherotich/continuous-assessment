# Variables #
#AWS region to deploy the resources #
variable "region" {
  default     = "eu-west-1"
}
#---------------
# VPC CIDR block network range for the VPC #
variable "vpc_cidr" {
  default = "10.0.0.0/24"
}
#-----------------
# Public Subnet CIDR within the VPC CIDR range
variable "public_subnet_cidr" {
  default = "10.0.0.0/25"
}
#-----------------
#Private Subnet for private servers like Database#
variable "private_subnet_cidr" {
  default = "10.0.0.128/25"
}
#-----------------
#Amazon Machine Image  ID for the EC2 instance#
variable "ami_id" {
  default = "ami-0ef0fafba270833fc" # Ubuntu 22.04 server LTS
}
#-----------------
# EC2 instance type used t3.micro (Free tier)
variable "instance_type" {
  default = "t3.micro"
}
#-------------------------
# Key pair name for SSH access to EC2 instance #
variable "key" {
  default = {
    name = "ec2-instance-key"
    path = "/home/precious/ssh-keys/ec2-instance-key.pub"
  }
}
#--------------
# To provision more than one instance #
#variable "instance_count" {
# default     = 1

