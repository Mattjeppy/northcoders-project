variable "cluster_name" {
  description = "The name of the EKS cluster - used for identifying network aspects with tags"
  type        = string
  default     = "ce-cluster"
}

# variable "vpc_id" {
#   description = "The ID of the VPC to place the cluster id"
#   type        = string
# }

# variable "private_subnets" {
#   description = "Private Subnet IDs for the cluster"
#   type        = list(string)
# }

variable "desired_size" {

  type = number
  default = 10
}

variable "project_name" {

  type = string
  default = "ce-eks-vpc"
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-2"
}
