resource "aws_s3_bucket" "weather_bucket" {
    bucket = var.bucket_name
}

resource "aws_s3_bucket_notification" "lambda_trigger" {
    count = var.create_resource ? 1 : 0
    bucket = aws_s3_bucket.weather_bucket
    lambda_function {
        lambda_function_arn = var.lambda_function_arn
        events = ["s3:ObjectCreated:*"]
    }
}