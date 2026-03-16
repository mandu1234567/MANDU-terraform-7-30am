resource "aws_lambda_function" "name" {
    function_name = "mandu-lambda-function"
    role          = aws_iam_role.lambda_execution_role.arn
    handler       = "function.lambda_handler"
    runtime       = "python3.10"
    
    filename      = "function.zip"
    
    source_code_hash = filebase64sha256("function.zip")
}

resource "aws_iam_role" "lambda_execution_role" {
    name = "mandu-lambda-execution-role"
    
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
resource "aws_iam_role_policy_attachment" "lambda_execution_role_attachment" {
    role       = aws_iam_role.lambda_execution_role.name
    policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}