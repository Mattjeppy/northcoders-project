data "aws_caller_identity" "current" {}

data "aws_availability_zones" "zones" {}

data "aws_vpc" "vpc" {
  id = module.vpc.vpc_id
}

