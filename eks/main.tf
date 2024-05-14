terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "5.37.0"
    }
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_eks_cluster" "k8s" {
  role_arn = "arn:aws:iam::590183853636:role/LabRole"
  name= var.eks_name
  version = "1.29"
  vpc_config {
    subnet_ids = ["subnet-0b2b09ce751084d7a","subnet-051b071ec0159d166", "subnet-05d45f31b8fe7f50a"]    
    endpoint_public_access = true    
  }
}

resource "aws_eks_node_group" "node" {
    cluster_name = aws_eks_cluster.k8s.name
    node_group_name = "node_group_k8s"
    node_role_arn = "arn:aws:iam::590183853636:role/LabRole"
    subnet_ids = ["subnet-0b2b09ce751084d7a","subnet-051b071ec0159d166", "subnet-05d45f31b8fe7f50a"]   
    
    scaling_config {
        desired_size = var.qtde_nodes
        max_size     = 3
        min_size     = 1                
    }
}
