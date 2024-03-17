Creating a comprehensive `README.md` document for your Terraform and Terragrunt infrastructure setup involves summarizing the project structure, explaining how to deploy and manage the infrastructure, and highlighting important considerations such as security, teamwork, and infrastructure as code (IaC) principles. Below is a structured template for your `README.md` that incorporates best practices, the provided configuration snippets, and your infrastructure management approach.

---

# AWS Infrastructure Management with Terraform and Terragrunt

## Overview

This project outlines our approach to managing AWS infrastructure, focusing on networking, Kubernetes (EKS), security, and state management using Terraform, Terragrunt, and AWS best practices. Our setup emphasizes scalability, data management, and efficient team collaboration.

### Key Components

- **VPC Structure**: Organized and secure networking setup across multiple AWS regions.
- **Kubernetes (EKS)**: Configuration and management of our Kubernetes clusters for container orchestration.
- **State Management**: Using S3 and DynamoDB for Terraform state locking and versioning, facilitating safe team collaboration.
- **Security**: Robust IAM policies and roles for secure access and operations within AWS.

## Infrastructure Modules

Our infrastructure is defined across modular Terraform configurations for ease of management, testing, and deployment:

- `infrastructure-modules/`
  - `vpc/`: VPC configurations for different environments and regions.
  - `eks/`: EKS cluster setup and configuration.
  - `security/`: IAM roles and policy definitions.

## Getting Started

### Prerequisites

- AWS CLI installed and configured.
- Terraform and Terragrunt installed.
- Access to AWS account with necessary permissions.

### Configuration

1. **AWS Profile**: Ensure your AWS CLI is configured with the necessary credentials:

   ```sh
   aws configure --profile solitics-user
   ```

2. **S3 Bucket for Terraform State**:

   ```hcl
   # In your backend configuration
   backend "s3" {
     bucket         = "solitics-devops-terraform-state"
     key            = "<path-to-your-state-file>"
     region         = "eu-west-1"
     dynamodb_table = "terraform-lock-table"
     encrypt        = true
   }
   ```

3. **DynamoDB for State Locking**:

   - Table name: `terraform-lock-table`
   - Primary key: `LockID`

4. **IAM Role and Policy for Terraform**:

   - Role: `arn:aws:iam::864492617736:role/terraform`
   - Policy: Allows Terraform to assume this role for resource management.

### Deployment

To deploy the infrastructure, navigate to the respective environment and region directory under `live/` and run:

```sh
terragrunt apply
```

## Best Practices

- **Infrastructure as Code (IaC)**: We adhere to IaC principles, defining all infrastructure through code for consistency, repeatability, and version control.
- **Module Use**: Avoid large, monolithic modules. Break down infrastructure into smaller, reusable modules for better performance and manageability.
- **DRY Principle**: Terragrunt helps us keep our configurations DRY, defining backend configurations once and reusing modules across environments.
- **Security**: Minimize public access where possible (e.g., `endpoint_public_access = false` for EKS). Use IAM roles and policies to tightly control permissions.
- **Team Collaboration**: Utilize S3 for state storage and DynamoDB for state locking to prevent conflicts and ensure smooth team operations.

## Security

Security credentials for AWS are managed via IAM roles and policies. Never hard-code credentials in your Terraform configurations. Use AWS profiles or environment variables for authentication.

## Troubleshooting

- Ensure your AWS profile is correctly configured with the necessary permissions.
- Verify Terraform and Terragrunt versions for compatibility.
- Check the AWS console for any service-specific limitations or errors.

---

### Note

- Replace placeholders and generic terms with your specific configuration details.
- Expand each section based on your project's specifics, including additional setup instructions, configuration details, or deployment steps as necessary.
- Regularly update the README as your infrastructure evolves.


### Test

1. Copy Dev or Staging folder
2. Rename it
3. Run command in the new folder 
terragrunt run-all apply

4. Update context
aws eks update-kubeconfig --name dev-solitics-demo --region eu-west-2
5. kubectl get nodes

In case it doesn't work:

vim ~/.aws/config

[default]
region=us-west-2
output=json

[profile solitics-user]
region = eu-west-2

[profile terraform]
role_arn = arn:aws:iam::864492617736:role/terraform
source_profile = solitics-user

