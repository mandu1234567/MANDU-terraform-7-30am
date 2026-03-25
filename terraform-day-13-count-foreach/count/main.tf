resource "aws_instance" "name" {
    ami = var.ami_id
    instance_type = var.instance_type
    count = length(var.env)
     tags = {
        Name = var.env[count.index]  #so here we are creating 3 instances with different name
       
}
}
variable "ami_id" {
    type = string
    description = "ami_id for the instance"  
}
variable "instance_type" {
    type = string
    description = "instance_type for the instance"  
}
variable "env" {
    type = list(string)
    description = "enviroment for the instance"  
    default = [ "dev" , "prod" ]
}