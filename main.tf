
# Provision the VPC network
module "networking" {
    source          = "./modules/vpc"

    vpc_name        = var.vpc_name
    cluster_name    = var.cluster_name
}

# Provision cluster
module "eks_cluster" {
    source          = "./modules/eks"
    desired_size    = var.desired_size
    vpc_id          = module.networking.vpc_id
    private_subnets = module.networking.private_subnets
    cluster_name    = var.cluster_name
}

# provision ECR 
module "ecr" {
 source          = "./modules/ecr"
 frontend_repository = var.frontend_repository
 backend_repository = var.backend_repository
}
# Desired Size Hack
resource "null_resource" "update_desired_size" {
  triggers = {
    desired_size = var.desired_size
  }

  provisioner "local-exec" {
    interpreter = ["/bin/bash", "-c"]

    # Note: this requires the awscli to be installed locally where Terraform is executed
    command = <<-EOT
      aws eks update-nodegroup-config \
        --cluster-name ${module.eks_cluster.cluster_name} \
        --nodegroup-name ${element(split(":", module.eks_cluster.node_group_id), 1)} \
        --scaling-config desiredSize=${var.desired_size}
    EOT
  }
}