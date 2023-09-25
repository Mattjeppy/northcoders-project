variable "project_name" {
  type = string
}

variable "region" {
  type = string
}

variable "postgres_database" {
  type = string
}

variable "postgres_username" {
  type = string
}

variable "postgres_password" {
  type = string
}

variable "private_subnets" {
  description = "Private Subnet IDs for the cluster"
  type        = list(string)
}

variable "vpc_security_group_ids" {

    type = string
  
}