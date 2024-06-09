### RDS Variables
variable "rds_name" {
  type = string
}

variable "rds_engine" {
  type = string
}

variable "rds_engine_version" {
  type = string
}

variable "rds_instance_class" {
  type = string
}

variable "rds_allocated_storage" {
  type = number
}

variable "rds_username" {
  type = string
}

variable "multi_az" {
  type = bool
}

variable "rds_parameter_group_name" {
  type = string
}

variable "rds_vpc_security_group_ids" {
  type = string
}

variable "rds_db_subnet_group_name" {
  type = string
}

variable "rds_skip_final_snapshot" {
  type = bool
}

### RDS Subnet Group
variable "rds_subnet_group_name" {
  type = string
}

variable "rds_subnet_ids" {
  type = list(string)
}

### RDS Security Group
variable "rds_sg_name" {
  type = string
}

variable "rds_sg_description" {
  type = string
}

variable "rds_sg_vpc_id" {
  type = string
}

## RDS Security Group - Ingress
variable "rds_sg_ingress_port" {
  type = number
}

variable "rds_sg_ingress_protocol" {
  type = string
}

variable "rds_sg_ingress_cidr_blocks" {
  type = list(string)
}

## RDS Security Group - Egress
variable "rds_sg_egress_port" {
  type = number
}

variable "rds_sg_egress_protocol" {
  type = string
}

variable "rds_sg_egress_cidr_blocks" {
  type = list(string)
}