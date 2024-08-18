output "elasticache_endpoint" {
  description = "Endpoint del clúster ElastiCache."
  value       = aws_elasticache_cluster.main.cache_nodes[0].address
}

output "elasticache_port" {
  description = "Puerto del clúster ElastiCache."
  value       = aws_elasticache_cluster.main.port
}
