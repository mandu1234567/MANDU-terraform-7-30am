variable "ami_id" {
    type = string
    description = "ami_id for the instance"
}
variable "instance_type" {
    type = string
    description = "isntance type for the instance"
}
variable "env" {
    type = string
    description = " environemnt name "
}
variable "cidr_block" {
    type = string
    description = "cidrblock for the vpc"
}
variable "availability_zone" {
    type = string
    description = "az for the vpc"
}
variable "public_subnet_cidr" {
       type = string
    description = "public subnet cidr for the subnet"
}
variable "region" {
    type = string
    description = "region for the deployment"
}