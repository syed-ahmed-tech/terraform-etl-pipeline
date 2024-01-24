provider "aws" {
    region = "eu-west-2"
}

module "weather_retreive_lambda" {
    source = "./modules/lambda"
    function_name = var.weather_retreive_lambda_function_name
    runtime = var.weather_retreive_lambda_runtime
    handler = var.weather_retreive_lambda_handler
    filename = var.weather_retreive_lambda_filename
    iam_role_name = var.weather_retreive_lambda_iam_role_name
    s3_bucket = module.weather_landing_s3.s3_bucket_arn
}

module "weather_etl_lambda" {
    source = "./modules/lambda"
    function_name = "weather_etl"
    runtime = "python3.8"
    handler = "lambda_handler.handler"
    filename = "/path/to/etl/lambda"
    iam_role_name = "weather_etl_lambda_iam_role"
    s3_bucket = module.weather_transformed_s3.s3_bucket_arn
}

module "weather_landing_s3" {
    source = "./modules/s3"
    create_resource = true
    bucket_name = "weather_landing"
    lambda_function_arn = module.weather_etl_lambda.lambda_arn
}

module "weather_transformed_s3" {
    source = "./modules/s3"
    create_resource = false
    bucket_name = "weather_transformed"
    lambda_function_arn = ""
}

module "weather_trigger" {
    source = "./modules/event_bridge"
    event_rule_name = "weather trigger"
    schedule_expression = "cron(0 5 ? * MON-FRI *)"
    lambda_arn = module.weather_retreive_lambda.lambda_arn
}