output "event_rule_arn" {
    value = aws_cloudwatch_event_rule.rule.arn
}

output "event_rule_name" {
    value = aws_cloudwatch_event_rule.rule.name
}