variable "function_name" {
    description = "Name of function"
    type = string
}

variable "runtime" {
    description = "Runtime of lambda function"
    type = string
}

variable "handler" {
    description = "Name and path of the lambda function handler"
    type = string
}

variable "filename" {
    description = "Name and file path of the code"
    type = string
}

variable "iam_role_name" {
    description = "Name of the IAM role"
    type = string
}

variable "s3_bucket" {
    description = "Refernce to S3 bucket"
    type = string
}