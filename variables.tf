variable "vpc_name" {
  description = "Name of the VPC to place cluster in"
  type        = string
  default     = "ce-eks-vpc"
}

variable "cluster_name" {
  description = "Name you wish to give to your EKS cluster"
  type        = string
  default     = "ce-cluster"
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-2"
}



variable "project_name" {
  default = "lovegames"
  
}


variable "postgres_database" {
  default = "testdb"
}

variable "postgres_username" {
  default = "postgres"
}

variable "postgres_password" {
  default = "mysecretpassword"
}


variable "frontend_repository" {
  type        = string
  description = "project-frontend"
  default = "lovegames-project-frontend"
}

variable "backend_repository" {
  type        = string
  description = "project-backend"
  default = "lovegames-project-backend"
}