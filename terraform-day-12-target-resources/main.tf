
resource "aws_instance" "ec2_instance" {
    ami           = "ami-02dfbd4ff395f2a1b"
    instance_type = "t3.micro"
  
}
resource "aws_s3_bucket" "s3_bucket" {
    bucket = "mandu-bucket-mandu"
  
}