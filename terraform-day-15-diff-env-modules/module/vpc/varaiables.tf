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
variable "env" {
   type = string
    description = "environemnt name "
    }