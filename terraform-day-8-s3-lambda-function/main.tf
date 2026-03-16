resource "aws_s3_bucket" "name" {
  bucket = "mandu-terraform-8"

}
resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.name.bucket
  key    = "function.zip"
  source = "function.zip"
  etag   = filemd5("function.zip")
}

resource "aws_iam_role" "IAM_role" {
  name = "lambda_s3_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })

}
resource "aws_iam_role_policy_attachment" "lambda_policy_attachment" {
  role       = aws_iam_role.IAM_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_role_policy_attachment" "s3_policy_attachment" {
  role       = aws_iam_role.IAM_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"

}
resource "aws_lambda_function" "name" {
  function_name = "s3_lambda_function"
  role          = aws_iam_role.IAM_role.arn
  handler = "function.lambda_handler"
  runtime = "python3.8"
  timeout = 900
  memory_size = 128
  s3_bucket = aws_s3_bucket.name.bucket
  s3_key    = aws_s3_object.object.key
}
