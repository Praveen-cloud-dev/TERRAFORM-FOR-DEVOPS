module "eks" {
#import the module template
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.11.0"
#cluster info (imp-for control plane)
  cluster_name = local.name
  cluster_version = "1.31"

  # Optional
  cluster_endpoint_public_access = true #so other can access the eks cluster
  
  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets


#control plane network
  control_plane_subnet_ids = module.vpc.intra_subnets 

# node groups(default node group)-managing the worker nodes
  eks_managed_node_group_defaults = { #in this we are defining the default values for all the node groups
  
  cluster_addons = { #these are the extension similar to vs code extensions
    vpc-cni={                                       #cluster network interface
      most-recent=true
    }
    kube-proxy={
      most-recent=true
    }
    coredns={
      most-recent=true
    }
  }
  instance_types = ["t2.medium"]
  attach_cluster_primary_security_group = true   
     
    }
   # EKS Managed Node Group(s)
  eks_managed_node_groups = {
  praveen-cluster-ng = {
    instance_types = ["t2.medium"]

    min_size     = 2
    max_size     = 3
    desired_size = 2
    capacity_type = "SPOT" # use for spot instances --unused capacity on lower cost
    }
  }
  tags = {
    Environment = local.env
    Terraform   = "true"
  }



}