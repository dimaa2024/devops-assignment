variable "region" {
  description = "AWS region to create resources"
  default     = "us-west-2"
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  default     = "devops-cluster"
}