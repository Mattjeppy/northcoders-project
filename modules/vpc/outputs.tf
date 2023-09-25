output "vpc_id" {
  description = "The ID of the VPC created"
  value       = module.vpc.vpc_id
}

output "private_subnets" {
  description   = "The IDs of the private subnets created"
  value         = module.vpc.private_subnets
}

output "vpc_security_group_ids" {

  value = aws_default_security_group.vpc_security_group.id
  
}