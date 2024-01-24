variable "event_rule_name" {
    description = "Name of Event rule"
    type = string
}

variable "schedule_expression" {
    description = "CRON schedule expression"
    type = string
}

variable "lambda_arn" {
    description = "ARN of target lambda"
    type = string
}