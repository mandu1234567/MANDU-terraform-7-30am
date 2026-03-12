resource "aws_vpc" "network" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name = "Siddrath_vpc"
    }
  
}

resource "aws_instance" "instance" {
    ami = "ami-02dfbd4ff395f2a1b"
    instance_type = "t3.micro"
    tags = {
      Name = "Siddrath_instance"
    }
}