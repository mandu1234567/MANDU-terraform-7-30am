variable "ami_id" {
    description = "ami_id"
    type = string
  
}
variable "instance_type" {
    description = "instance_type"
    type = string
  
}
variable "env" {
    description = "environment name"
    default =[ "dev" ,"test"]
    type = list(string)
}

resource "aws_instance" "name" {
    ami = var.ami_id
    instance_type = var.instance_type
    for_each = toset(var.env) 
     tags = {
        Name = each.key 
}
}