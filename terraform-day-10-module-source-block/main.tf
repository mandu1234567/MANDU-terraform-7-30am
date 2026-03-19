module "ec2_instance" {
    source = "../terraform-day-10-module-template-block"
    ami_id = "ami-02dfbd4ff395f2a1b"
    instance_type = "t3.micro"
}
