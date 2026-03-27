variable "ami_id" {
    type = string
    description = "ami_id for the instance"
}
variable "instance_type" {
    type = string
    description = "isntance type for the instance"
}
variable "subnet_id" {
    type = string
    description = "subnet for the instance"
}
variable "env" {
    type = string
    description = " environemnt name "
}