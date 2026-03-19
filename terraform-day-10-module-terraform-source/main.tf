module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  name = "ec2-instance"
  instance_type = "t3.micro"
  subnet_id = "subnet-02f24b7020d4d45bc"
}