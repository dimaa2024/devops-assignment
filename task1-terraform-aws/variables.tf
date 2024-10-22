variable "region" {
  description = "AWS region to create resources"
  default     = "us-west-2"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}