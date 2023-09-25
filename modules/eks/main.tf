module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.15.2"

  cluster_name    = var.cluster_name
  cluster_version = "1.27"

  vpc_id                         = data.aws_vpc.vpc.id
  subnet_ids                     = data.aws_subnets.subnets_private.ids
  cluster_endpoint_public_access = true

  eks_managed_node_group_defaults = {
    ami_type = "AL2_x86_64"
  }

  # For cost management purposes
  # a single node group, with a 
  # single node within the group
  eks_managed_node_groups = {
    one = {
    name = "node-group-1"

    instance_types = ["t2.micro"]
      
    desired_size = var.desired_size
    max_size     = 10
    min_size     = 10
      
      
    }
  }
  
   node_security_group_additional_rules = {
    ingress_self_all = {
      description = "Node to node all ports/protocols"
      protocol    = "-1"
      from_port   = 0
      to_port     = 0
      type        = "ingress"
      self        = true
    }

    egress_all = {
      description      = "Node all egress"
      protocol         = "-1"
      from_port        = 0
      to_port          = 0
      type             = "egress"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }
  }
}

# Desired Size Hack
resource "null_resource" "update_desired_size" {
   depends_on = [module.eks.eks]
  triggers = {
    desired_size = var.desired_size
  }

  provisioner "local-exec" {
    interpreter = ["/bin/bash", "-c"]

    # Note: this requires the awscli to be installed locally where Terraform is executed
    command = <<-EOT
      
      aws eks update-nodegroup-config \
        --cluster-name ${var.cluster_name} \
        --nodegroup-name ${element(split(":", module.eks.eks_managed_node_groups.one.node_group_id), 1)} \
        --scaling-config desiredSize=${var.desired_size}
    EOT
  }
}

resource "null_resource" "install_jenkins" {
  depends_on = [module.eks.eks]
  triggers = {
    eks_cluster_id = module.eks.cluster_id
  }

  provisioner "local-exec" {
    
    command = <<-EOT
       aws eks update-kubeconfig --name ce-cluster && \
        helm repo add jenkins https://charts.jenkins.io && \
        helm repo update && \
        helm install jenkins jenkins/jenkins \
        --namespace jenkins \
        --create-namespace \
        --set jenkinsAdminUser=admin \
        --set jenkinsAdminPassword=mysecretpassword
    EOT

    interpreter = ["/bin/bash", "-c"]
  }
}

  

resource "aws_security_group_rule" "postgresql_ec2_instances_sg" {
  security_group_id = data.aws_security_group.default_security_group.id

  type      = "ingress"
  protocol  = "tcp"
  from_port = 5432
  to_port   = 5432
  
  source_security_group_id = module.eks.node_security_group_id
  
  lifecycle {
    create_before_destroy = true
  }
}