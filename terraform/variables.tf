variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

# variable "AccessKey" {
#   description = "AWS Access Key ID"
#   type        = string
#   sensitive   = true
# }

# variable "SecretKey" {
#   description = "AWS Secret Access Key"
#   type        = string
#   sensitive   = true
# }

variable "eks_cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
  default     = "my-cluster" # Optionally, provide a default value
}
