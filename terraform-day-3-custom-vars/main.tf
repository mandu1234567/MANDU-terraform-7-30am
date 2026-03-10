resource "aws_instance" "Default" {
  ami           = var.ami_id
  instance_type = var.instance_type
  tags = {
    Name = "root-instance"
  }
}
resource "aws_instance" "Dev" {
  ami           = var.dev_ami_id
  instance_type = var.dev_instance_type
  provider = aws.devops
  tags = {
    Name = "Dev-instance"
  }
}
