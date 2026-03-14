resource "aws_vpc" "name" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "Mandu-vpc"
    }
  
}
##### for public subnets
resource "aws_subnet" "Public" {
    vpc_id = aws_vpc.name.id
    cidr_block = "10.0.0.0/24"
    availability_zone = "us-east-1a"
    tags = {
        Name = "Mandu-public-subnet"
    }
}

resource "aws_internet_gateway" "name" {
    vpc_id = aws_vpc.name.id
    tags = {
        Name = "Mandu-igw"
    }
  
}
resource "aws_route_table" "Public" {
    vpc_id = aws_vpc.name.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.name.id
        }
    tags = {
        Name = "Mandu-public-rt"
    }
}
resource "aws_route_table_association" "Public" {
    subnet_id = aws_subnet.Public.id
    route_table_id = aws_route_table.Public.id
}

###### for private subnets
resource "aws_subnet" "Private" {
    vpc_id = aws_vpc.name.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-east-1a"
    tags = {
        Name = "Mandu-private-subnet"
    }
}
resource "aws_eip" "Nat" {
    tags = {
        Name = "Mandu-nat-eip"
    }
}
resource "aws_nat_gateway" "Nat" {
    allocation_id = aws_eip.Nat.id
    subnet_id = aws_subnet.Public.id
    tags = {
        Name = "Mandu-nat-gateway"
    }
}
resource "aws_route_table" "Private" {
    vpc_id = aws_vpc.name.id
    route  {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.Nat.id
        }
    tags = {
        Name = "Mandu-private-rt"
        }
}   
resource "aws_route_table_association" "Private" {
    subnet_id = aws_subnet.Private.id
    route_table_id = aws_route_table.Private.id
}

resource "aws_instance" "name" {
    ami = "ami-02dfbd4ff395f2a1b"
    instance_type = "t3.micro"
    subnet_id = aws_subnet.Private.id
    security_groups = [aws_security_group.name.id]
    tags = {
        Name = "Mandu-private-instance"
    }
    depends_on = [ aws_vpc.name , aws_subnet.Private ]
  
}
resource "aws_security_group" "name" {
    name = "Mandu-sg"
    description = "Allow SSH and HTTP traffic"
    vpc_id = aws_vpc.name.id

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
  
}