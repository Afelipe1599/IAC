# outputs.tf en el módulo Network Load Balancer

output "nlb_arn" {
  description = "ARN del Network Load Balancer"
  value       = aws_lb.nlb.arn
}

output "target_group_arn" {
  description = "ARN del grupo de destino"
  value       = aws_lb_target_group.tg.arn
}
