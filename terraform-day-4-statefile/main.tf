resource "aws_vpc" "name" {
    cidr_block = "10.0.0.0/24"
    tags = {
        Name = "Mandu-VPC"
    }
  
}
resource "aws_instance" "name" {
    ami = "ami-02dfbd4ff395f2a1b"
    instance_type = "t3.micro"
    tags = {
        Name = "Mandu-Instance"
    }
  
}