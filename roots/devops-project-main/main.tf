# DO NOT REMOVE DUMMY MODULE references and their code, they should remain as examples
module "module1" {
  source = "../../dummy-module-1"
  # ... any required variables for module1
  greeting = var.greeting

}

module "module2" {
  source = "../../dummy-module-2"

  input_from_module1 = module.module1.greeting_message
  # ... any other required variables for module2
}

module "versusRDS" {
  source = "../../versus-rds-module"

  ### RDS Variables
  rds_name                   = var.rds_name
  rds_engine                 = var.rds_engine
  rds_engine_version         = var.rds_engine_version
  rds_instance_class         = var.rds_instance_class
  rds_allocated_storage      = var.rds_allocated_storage
  rds_username               = var.rds_username
  multi_az                   = var.multi_az
  rds_parameter_group_name   = var.rds_parameter_group_name
  rds_vpc_security_group_ids = var.rds_vpc_security_group_ids
  rds_db_subnet_group_name   = var.rds_db_subnet_group_name
  rds_skip_final_snapshot    = var.rds_skip_final_snapshot

  ### RDS Subnet Group
  rds_subnet_group_name = var.rds_subnet_group_name
  rds_subnet_ids        = var.rds_subnet_ids

  ### RDS Security Group
  rds_sg_name        = var.rds_sg_name
  rds_sg_description = var.rds_sg_description
  rds_sg_vpc_id      = var.rds_sg_vpc_id

  ## RDS Security Group - Ingress
  rds_sg_ingress_port        = var.rds_sg_ingress_port
  rds_sg_ingress_protocol    = var.rds_sg_ingress_protocol
  rds_sg_ingress_cidr_blocks = var.rds_sg_ingress_cidr_blocks

  ## RDS Security Group - Egress
  rds_sg_egress_port        = var.rds_sg_egress_port
  rds_sg_egress_protocol    = var.rds_sg_egress_protocol
  rds_sg_egress_cidr_blocks = var.rds_sg_egress_cidr_blocks
}

output "rds_subnet_group_name" {
  value = module.versusRDS.rds_subnet_group_name
}

output "rds_security_group_name" {
  value = module.versusRDS.rds_security_group_name
}