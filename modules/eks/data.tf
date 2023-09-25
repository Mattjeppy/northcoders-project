
data "aws_vpc" "vpc" {
tags = {
    Name = var.project_name
  }
}

data "aws_subnets" "subnets_private" {
  
   filter {
    name   = "tag:Name"
    values = ["*private*"]
  }
}


data "aws_security_group" "default_security_group" {
  vpc_id = data.aws_vpc.vpc.id

  name = "default"
}