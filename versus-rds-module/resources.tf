resource "aws_db_instance" "rds" {
  depends_on = [aws_secretsmanager_secret_version.rds_secret_version]

  db_name                = var.rds_name
  engine                 = var.rds_engine
  engine_version         = var.rds_engine_version
  instance_class         = var.rds_instance_class
  allocated_storage      = var.rds_allocated_storage
  multi_az               = var.multi_az
  username               = var.rds_username
  password               = jsondecode(data.aws_secretsmanager_secret_version.rds_secret_value.secret_string)["password"]
  parameter_group_name   = var.rds_parameter_group_name
  vpc_security_group_ids = [aws_security_group.rds-sg.id]
  db_subnet_group_name   = var.rds_db_subnet_group_name
  skip_final_snapshot    = var.rds_skip_final_snapshot

}

### RDS Subnet Group
resource "aws_db_subnet_group" "rds-subnet-group" {
  name       = var.rds_db_subnet_group_name
  subnet_ids = var.rds_subnet_ids
}

### RDS Security Group
resource "aws_security_group" "rds-sg" {
  name        = var.rds_sg_name
  description = var.rds_sg_description
  vpc_id      = var.rds_sg_vpc_id

  ingress {
    from_port   = var.rds_sg_ingress_port
    to_port     = var.rds_sg_ingress_port
    protocol    = var.rds_sg_ingress_protocol
    cidr_blocks = var.rds_sg_ingress_cidr_blocks
  }

  egress {
    from_port   = var.rds_sg_egress_port
    to_port     = var.rds_sg_egress_port
    protocol    = var.rds_sg_egress_protocol
    cidr_blocks = var.rds_sg_egress_cidr_blocks
  }
}