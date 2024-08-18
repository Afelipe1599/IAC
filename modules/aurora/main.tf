# main.tf en el módulo Aurora

resource "aws_rds_cluster" "aurora" {
  cluster_identifier      = var.cluster_identifier
  engine                  = "aurora-mysql"
  engine_version          = "5.7.mysql_aurora.2.11.2"
  database_name           = var.database_name
  master_username         = var.master_username
  master_password         = var.master_password
  backup_retention_period = 7
  preferred_backup_window = "07:00-09:00"
  vpc_security_group_ids  = [var.security_group_id]
  db_subnet_group_name    = aws_db_subnet_group.aurora.name

  tags = var.tags
}

resource "aws_rds_cluster_instance" "aurora_instance" {
  count                = 2
  identifier           = "${var.cluster_identifier}-instance-${count.index}"
  cluster_identifier   = aws_rds_cluster.aurora.id
  instance_class       = "db.r5.large"
  engine               = aws_rds_cluster.aurora.engine
  engine_version       = aws_rds_cluster.aurora.engine_version
  db_subnet_group_name = aws_db_subnet_group.aurora.name
  publicly_accessible  = false

  tags = var.tags
}

resource "aws_db_subnet_group" "aurora" {
  name       = "${var.cluster_identifier}-subnet-group"
  subnet_ids = var.subnet_ids

  tags = var.tags
}

resource "aws_rds_cluster_endpoint" "reader" {
  cluster_identifier          = aws_rds_cluster.aurora.id
  cluster_endpoint_identifier = "${var.cluster_identifier}-reader"
  custom_endpoint_type        = "READER"
}

resource "aws_db_proxy" "rds_proxy" {
  name                   = "${var.cluster_identifier}-proxy"
  engine_family          = "MYSQL"
  role_arn               = var.proxy_role_arn
  vpc_security_group_ids = [var.security_group_id]
  vpc_subnet_ids         = var.subnet_ids

  auth {
    auth_scheme = "SECRETS"
    iam_auth    = "DISABLED"
    secret_arn  = var.secret_arn
  }

  require_tls = true
  tags        = var.tags
}
resource "aws_db_proxy_target" "proxy_target" {
  db_cluster_identifier = aws_rds_cluster.aurora.id
  db_proxy_name         = aws_db_proxy.rds_proxy.name
  target_group_name     = "default"  # Proporciona el nombre del grupo de destino correcto
}
