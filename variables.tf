variable "weather_retreive_lambda_function_name" {
    default = "weather_retreive"
    type = string
}

variable "weather_retreive_lambda_handler" {
    default = "lambda_handler.handler"
    type = string
}

variable "weather_retreive_lambda_filename" {
    default = "/data/codebase"
    type = string
}

variable "weather_retreive_lambda_iam_role_name" {
    default = "weather_retreive_iam_role"
    type = string
}

variable "weather_retreive_lambda_runtime" {
    default = "python3.8"
    type = string
}
