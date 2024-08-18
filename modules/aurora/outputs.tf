# outputs.tf en el módulo Aurora

output "aurora_endpoint" {
  description = "Endpoint del clúster Aurora"
  value       = aws_rds_cluster.aurora.endpoint
}

output "rds_proxy_endpoint" {
  description = "Endpoint del RDS Proxy"
  value       = aws_db_proxy.rds_proxy.endpoint
}

