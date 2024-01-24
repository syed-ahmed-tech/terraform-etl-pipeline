resource "aws_lambda_function" "weather" {
    function_name = var.function_name
    runtime = var.runtime
    handler = var.handler
    filename = var.filename
    role = aws_iam_role.lambda_role.arn
    environment {
        variables = {
            S3_BUCKET = var.s3_bucket
        }
    }
}

resource "aws_iam_role" "lambda_role" {
    name = var.iam_role_name
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
    policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
    role = aws_iam_role.lambda_role.name
}

resource "aws_iam_role_policy_attachment" "lambda_basic_policy_attachment" {
    policy_arn = "arn:aws:iam::aws:policy/AWSLambdaBasicExecutionRole"
    role = aws_iam_role.lambda_role.name
}

resource "aws_lambda_permission" "cloudwatch_logs" {
    statement_id = "AllowExecutionFromCloudWatchLogs"
    action = "lambda:InvokeFunction"
    principal = "logs.amazonaws.com"
    function_name = aws_lambda_function.weather.function_name
}

