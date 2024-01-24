resource "aws_cloudwatch_event_rule" "rule" {
    name = var.event_rule_name
    schedule_expression = var.schedule_expression
}

resource "aws_cloudwatch_event_target" "lambda_target" {
    rule = aws_cloudwatch_event_rule.rule
    target_id = "Invoke Lambda"
    arn = var.lambda_arn
}