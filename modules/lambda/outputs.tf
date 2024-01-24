output "lambda_arn" {
    value = aws_lambda_function.weather.arn
}

output "lambda_name" {
    value = aws_lambda_function.weather.function_name
}

output "lambda_invoke_url" {
    value = aws_lambda_function.weather.invoke_arn
}