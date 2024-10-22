provider "aws" {
  region = var.region
}
module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = var.cluster_name
  cluster_version = "1.21"
  subnets         = [aws_subnet.public.id]
  vpc_id          = aws_vpc.main.id
}