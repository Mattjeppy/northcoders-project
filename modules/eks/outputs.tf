output "cluster_name" {
  description = "Kubernetes Cluster Name"
  value       = module.eks.cluster_name
}

output "cluster_endpoint" {
  description = "Endpoint for EKS control plane"
  value       = module.eks.cluster_endpoint
}

output "cluster_security_group_id" {
  description = "Security group ids attached to the cluster control plane"
  value       = module.eks.cluster_security_group_id
}

output "node_group_id" {
  value = module.eks.eks_managed_node_groups.one.node_group_id
}

output "security_group_id_group_id" {
  value = module.eks.node_security_group_id
}

output "region" {
  description = "AWS region"
  value       = var.region
}


