resource "random_password" "rds_password" {
  length  = 16
  special = true
}

resource "aws_secretsmanager_secret" "rds_secret" {
  name        = "rds_password"
  description = "Password for versusRDS"
}

resource "aws_secretsmanager_secret_version" "rds_secret_version" {
  secret_id = aws_secretsmanager_secret.rds_secret.id
  secret_string = jsonencode({
    username = var.rds_username
    password = random_password.rds_password.result
  })
}

data "aws_secretsmanager_secret" "rds_secret" {
  name = aws_secretsmanager_secret.rds_secret.name
}

data "aws_secretsmanager_secret_version" "rds_secret_version" {
  secret_id = data.aws_secretsmanager_secret.rds_secret.id
}

data "aws_secretsmanager_secret_version" "rds_secret_value" {
  secret_id = data.aws_secretsmanager_secret.rds_secret.id
}