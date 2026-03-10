variable "ami_id" {
  type = string
  description = "deafult-ec2"
  default = ""
}
variable "instance_type" {
  type = string
  description = "Instance type for the EC2 instance"
  default = ""
}
variable "dev_ami_id" {
  type = string
  description = "dev-ec2"
  default = ""
}
variable "dev_instance_type" {
  type = string
  description = "Instance type for the dev EC2 instance"
  default = ""
}