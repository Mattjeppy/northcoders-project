variable "cluster_name" {
  description = "The name of the EKS cluster - used for identifying network aspects with tags"
  type        = string
  default     = "ce-cluster"
}



variable "desired_size" {

  type = number
  default = 5
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
