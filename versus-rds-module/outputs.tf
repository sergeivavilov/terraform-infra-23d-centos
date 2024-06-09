output "rds_subnet_group_name" {
  description = "Name of the subnet group for versusRDS"
  value       = aws_db_subnet_group.rds-subnet-group.name
}

output "rds_security_group_name" {
  description = "Name of the security group for versusRDS"
  value       = [aws_security_group.rds-sg.id]
}