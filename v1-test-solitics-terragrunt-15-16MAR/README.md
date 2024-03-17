# Project Infrastructure with Terraform and Terragrunt

This repository contains the infrastructure-as-code (IaC) for deploying and managing AWS resources for our project environments using Terraform and Terragrunt. It's designed to ensure a smooth, scalable, and maintainable infrastructure setup.

## Repository Structure

This project follows a structured approach to organize the Terraform and Terragrunt configurations:

├── infrastructure-live
│   ├── eu-west-1
│   │   ├── ec2-instances
│   │   │   └── terragrunt.hcl
│   │   ├── terragrunt.hcl
│   │   └── vpc
│   │       └── terragrunt.hcl
│   ├── eu-west-2
│   │   ├── dev
│   │   │   ├── eks
│   │   │   │   └── terragrunt.hcl
│   │   │   ├── env.hcl
│   │   │   ├── kubernetes-addons
│   │   │   │   └── terragrunt.hcl
│   │   │   └── vpc
│   │   │       └── terragrunt.hcl
│   │   ├── staging
│   │   │   ├── eks
│   │   │   │   └── terragrunt.hcl
│   │   │   ├── env.hcl
│   │   │   ├── kubernetes-addons
│   │   │   │   └── terragrunt.hcl
│   │   │   └── vpc
│   │   │       └── terragrunt.hcl
│   │   └── terragrunt.hcl
│   ├── global
│   │   ├── alb
│   │   │   └── terragrunt.hcl
│   │   └── cloudfront
│   │       └── terragrunt.hcl
│   ├── terragrunt.hcl 
│   └── transit-gateway
│       └── terragrunt.hcl
├── infrastructure-modules
│   ├── alb
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── cloudfront
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── ec2
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── eks
│   │   ├── 0-versions.tf
│   │   ├── 1-eks.tf
│   │   ├── 2-nodes-iam.tf
│   │   ├── 3-nodes.tf
│   │   ├── 4-irsa.tf
│   │   ├── 5-outputs.tf
│   │   └── 6-variables.tf
│   ├── kubernetes-addons
│   │   ├── 0-versions.tf
│   │   ├── 1-cluster-autoscaler.tf
│   │   └── 2-variables.tf
│   ├── transit-gateway
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   └── vpc
│       ├── 0-versions.tf
│       ├── 1-vpc.tf
│       ├── 2-igw.tf
│       ├── 3-subnets.tf
│       ├── 4-nat.tf
│       ├── 5-routes.tf
│       ├── 6-outputs.tf
│       └── 7-variables.tf
├── kubernetes-configs
│   └── nginx-deployment
│       ├── config
│       │   └── nginx.conf
│       ├── deployment.yaml
│       ├── ingress.yaml
│       └── service.yaml
├── README.md


- `infrastructure-live`: Contains environment-specific configurations and references to modules for resource provisioning.
- `infrastructure-modules`: Contains reusable Terraform modules for resources like VPCs, EKS clusters, and more.
- `kubernetes-configs`: Kubernetes deployment configurations and manifests.

## Getting Started

### Prerequisites

- Terraform >= 1.0
- Terragrunt
- AWS CLI configured with appropriate credentials

### Deployment Steps

1. **Initialize Terraform and Terragrunt:**

Navigate to the specific environment directory
under `infrastructure-live` and run:
terragrunt init

## Deploy Infrastructure:
terragrunt run-all apply

## Update Kubernetes Config:
For EKS clusters, update your kubeconfig:
aws eks update-kubeconfig --name <cluster-name> --region eu-west-2

## Deploy Kubernetes Manifests:
kubectl apply -f kubernetes-configs/nginx-deployment/deployment.yaml

## Security and IAM
Review and adhere to the principle of least privilege for IAM roles and policies.
Regularly audit security groups and resource configurations.

## Contributions and Modifications
For adding new resources, create a module under infrastructure-modules and reference it in the appropriate terragrunt.hcl file.
Follow the existing project structure for consistency.
Ensure to document any new configurations or changes.

## Documentation
Further documentation for specific modules and configurations can be found within each module's directory under infrastructure-modules.

## Support and Issues
For issues, questions, or support, please file an issue in the GitHub repository.

## License
Solitics Demo project's license # .

