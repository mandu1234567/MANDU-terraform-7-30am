resource "aws_s3_bucket" "name" {
  bucket = "mandu-bucket-mandu"
  depends_on = [ aws_instance.name ] # Ensure the EC2 instance is created before the S3 bucket

}

# create an IAM role for EC2 to assume
resource "aws_iam_role" "ec2_s3_role" {
  name = "ec2-s3-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_policy" "s3_access_policy" {
  name        = "s3-access-policy"
  description = "Allow EC2 to access S3"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:ListBucket",
          "s3:GetObject",
          "s3:PutObject"
        ]
        Resource = [
          "arn:aws:s3:::mandu-bucket-mandu",
          "arn:aws:s3:::mandu-bucket-mandu/*"
        ]
      }
    ]
  })
}


# attach the S3 access policy to the EC2 role
resource "aws_iam_role_policy_attachment" "attach_s3_policy" {
  role       = aws_iam_role.ec2_s3_role.name
  policy_arn = aws_iam_policy.s3_access_policy.arn
  depends_on = [ aws_iam_policy.s3_access_policy ]   # Ensure the policy is created before attachment
}

# creating profile for EC2 to use the role
resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = "ec2-instance-profile"
  role = aws_iam_role.ec2_s3_role.name
}

resource "aws_instance" "name" {
  instance_type = "t3.micro"
  ami           = "ami-02dfbd4ff395f2a1b"
  iam_instance_profile = aws_iam_instance_profile.ec2_instance_profile.name
  depends_on = [ aws_iam_role.ec2_s3_role ] # Ensure the IAM role is created before the EC2 instance

}

