resource "aws_instance" "name" {
    ami = data.aws_ami.amzlinux.id
    instance_type = "t3.micro"
    tags = {
        Name = "ec2-instance"
    }
}