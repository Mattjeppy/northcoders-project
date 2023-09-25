
# Provision the VPC network
module "networking" {
    source          = "./modules/vpc"

    vpc_name        = var.vpc_name
    cluster_name    = var.cluster_name
    project_name = var.project_name

}

# Provision repository 
module "ecr" {
    source          = "./modules/ecr"
    frontend_repository = var.frontend_repository
    backend_repository = var.backend_repository
}

# Provision database
module "rds" {
source = "./modules/rds"
project_name = var.project_name
region = var.region
postgres_database = var.postgres_database
postgres_username = var.postgres_username
postgres_password = var.postgres_password
vpc_security_group_ids = module.networking.vpc_security_group_ids
private_subnets = module.networking.private_subnets
}

 