locals {
  region        = "us-east-1"
  instance_type = "t3.micro"
  ami_id= "ami-0c3389a4fa5bddaad"
}

resource "aws_instance" "ec2_instance" {
  ami = local.ami_id
  instance_type = local.instance_type
  region = local.region
  vpc_security_group_ids = [aws_security_group.sg.id]
  subnet_id = aws_subnet.subnet.id
  tags = {
    Name = "my-ec2-instance"
  }
  depends_on = [ aws_vpc.vpc , aws_subnet.subnet , aws_security_group.sg ]
}
resource "aws_vpc" "vpc" {
    cidr_block = "10.0.0.0/16"
    enable_dns_support = true
    enable_dns_hostnames = true
    region = local.region
    tags = {
        Name = "my-vpc"
    }
  
}
resource "aws_subnet" "subnet" {
    vpc_id     = aws_vpc.vpc.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "${local.region}a"
}
resource "aws_security_group" "sg" {
    name        = "allow_ssh"
    description = "Allow SSH inbound traffic"
    vpc_id      = aws_vpc.vpc.id
    
    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"] 
}
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }   
    tags = {
        Name = "allow_ssh"
    }
}