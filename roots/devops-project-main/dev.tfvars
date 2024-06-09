greeting = "Hi"

### RDS Variables
rds_name                   = "versusRDS"
rds_engine                 = "mysql"
rds_engine_version         = "5.7"
rds_instance_class         = "db.t3.micro"
rds_allocated_storage      = 10
rds_username               = "admin"
multi_az                   = false
rds_parameter_group_name   = "default.mysql5.7"
rds_vpc_security_group_ids = "versus-rds-sg"
rds_db_subnet_group_name   = "versus-rds-subnet-group"
rds_skip_final_snapshot    = true

### RDS Subnet Group
rds_subnet_group_name = "versusRDS-subnet-group"
rds_subnet_ids        = ["subnet-0bcfaa2a", "subnet-3ab6285c", "subnet-13c0ee5e"]

### RDS Security Group
rds_sg_name        = "versusRDS-sg"
rds_sg_description = "Security group for Versus RDS"
rds_sg_vpc_id      = "vpc-4dcc6630"

## RDS Security Group - Ingress
rds_sg_ingress_port        = 3306
rds_sg_ingress_protocol    = "tcp"
rds_sg_ingress_cidr_blocks = ["0.0.0.0/0"]

## RDS Security Group - Egress
rds_sg_egress_port        = 0
rds_sg_egress_protocol    = "-1"
rds_sg_egress_cidr_blocks = ["0.0.0.0/0"]