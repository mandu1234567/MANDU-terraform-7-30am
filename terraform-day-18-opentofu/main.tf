resource "aws_instance" "ec2_instance" {
    ami           = "ami-0c3389a4fa5bddaad"
    instance_type = "t3.micro" 
    tags = {
      name = "open_tofu_instance"
    }
}