
resource "aws_vpc" "vpc_mandu" {
  cidr_block = var.cidr_block
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "${var.env}-vpc"
  }
}

resource "aws_internet_gateway" "IG" {
  vpc_id = aws_vpc.vpc_mandu.id
    tags = {
    Name = "${var.env}-igw"
  }
}
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.vpc_mandu.id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.env}-public-subnet"
  }
}


output "public_subnet_id" {
  value = aws_subnet.public.id
}