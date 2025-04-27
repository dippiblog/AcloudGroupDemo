# EKS Module Configuration
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.0.4"

  cluster_name    = local.cluster_name
  cluster_version = "1.32"

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets
  cluster_endpoint_public_access = true

  eks_managed_node_group_defaults = {
    ami_type = "AL2_x86_64"
  }

  eks_managed_node_groups = {
    one = {
      name = "node-group-1"
      instance_types = ["t3.small"]
      min_size     = 1
      max_size     = 3
      desired_size = 2
    }

    two = {
      name = "node-group-2"
      instance_types = ["t3.small"]
      min_size     = 1
      max_size     = 2
      desired_size = 1
    }
  }
}

# Backend Configuration for Remote State Storage in S3 with DynamoDB for State Locking
terraform {
  backend "s3" {
    bucket         = "248189903023-terraform-state-bucket"   # Replace with your actual S3 bucket name
    key            = "eks/terraform.tfstate"       # Path to store the state file in the bucket
    region         = "us-west-2"                   # Ensure this matches your AWS region
    encrypt        = true                          # Enable encryption for state file storage
    dynamodb_table = "terraform-state-lock"        # Ensure the DynamoDB table for state locking exists
    acl            = "bucket-owner-full-control"   # Optional but recommended for controlling bucket permissions
  }
}
