# Task 2: Kubernetes Deployment with AWS EKS

## Instructions
1. Deploy the EKS cluster with Terraform:
   ```sh
   terraform init
   terraform apply
   ```
2. Use Helm to deploy the application:
   ```sh
   helm install nginx ./helm-chart
   ```
3. Run the Python script to check if the application is reachable.
   Replace `<load_balancer_public_ip>` with the actual IP.