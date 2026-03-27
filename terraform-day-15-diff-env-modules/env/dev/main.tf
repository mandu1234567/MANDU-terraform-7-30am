provider "aws" {
  region = var.region
  profile = "dev"
}
module "vpc" {
    source = "../../module/vpc"
    cidr_block = var.cidr_block 
    availability_zone = var.availability_zone 
    public_subnet_cidr = var.public_subnet_cidr 
    env = var.env
  
}
module "ec2" {
    source = "../../module/ec2"
    ami_id = var.ami_id
    instance_type = var.instance_type
    subnet_id = module.vpc.public_subnet_id
    env = var.env 
}