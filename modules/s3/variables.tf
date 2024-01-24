variable "bucket_name" {
    description = "Name of bucket"
    type = string
}

variable "create_resource" {
    description = "conditional value to decide to create the resource or not"
    type = bool
}

variable "lambda_function_arn" {
    description = "ARN of the lambda function which will be triggered"
    type = string
}