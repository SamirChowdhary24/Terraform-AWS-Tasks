# TASK-4  
# Multi-Region AWS Infrastructure with Terraform
## Project Objective

This project aims to provision a secure, scalable, and highly available web application infrastructure on AWS. The architecture includes:

- A **Virtual Private Cloud (VPC)** to enable network isolation.
- **Public and private subnets** distributed across multiple Availability Zones (AZs) for resilience.
- **Internet Gateway** and **NAT Gateways** to manage inbound and outbound internet traffic securely.
- **Security Groups** to control communication between application tiers.
- **Launch Templates** and **Auto Scaling Groups (ASGs)** to manage dynamic scaling of frontend and backend servers.
- **Application Load Balancers (ALBs)** for intelligent traffic distribution.
- An **RDS database** deployed in private subnets to enhance data security.

This setup provides a robust foundation for running production-grade web applications with a strong emphasis on availability, security, and performance.


## Resources Overview

### Infrastructure
- **Region**: 1 AWS Region  
- **AZs**: 2 for high availability  
- **VPC**: Custom VPC with isolated tiers  

### Subnets
- **Web Tier**: Public subnets (1 per AZ)  
- **App Tier**: Private subnets (1 per AZ)  
- **DB Tier**: Private subnets (1 per AZ)  

### Networking
- Internet Gateway (IGW)  
- NAT Gateway in each public subnet  
- Route Tables with:
  - IGW for public subnets  
  - NAT for private subnets  

### Compute & Scaling
- Launch Templates for EC2  
- Auto Scaling Groups for:
  - Frontend (Web Tier)  
  - Backend (App Tier)  

### Load Balancer
- Public ALB (Web Tier)  
- Private ALB (App Tier)  
- HTTP/HTTPS listeners + target groups  

### EC2 Configuration
- AMI, instance types, SSH key  
- Network placement by tier




##  Project Directory Layout

The Structure looks like:

```bash
├── .task 4/                      
├── modules/                         # Reusable infrastructure modules
│   ├── alb/
│   ├── computing/
│   ├── networking/
│   ├── rds/
│   ├── security/
│   └── vpc/
├── main.tf                          # Root Terraform config
├── outputs.tf                       # Output variables
├── provider.tf                      # Provider and backend settings                     
├── terraform.tfvars                 # Environment-specific input variables           
├── variables.tf                     # Variable declarations
```
## Module Descriptions

### 🔹 VPC Module
- Provisions a VPC with a specified CIDR block.
- Creates:
  - Public subnets for the frontend.
  - Private subnets for backend and database layers across Availability Zones.
- Outputs:
  - VPC ID
  - Subnet IDs

---

### 🔹 Networking Module
- Attaches an Internet Gateway to the VPC.
- Allocates Elastic IPs and deploys NAT Gateways in public subnets.
- Configures and associates route tables for public and private subnets.
- Outputs:
  - Gateway IDs
  - Route Table IDs

---

### 🔹 Security Module
- Creates distinct security groups:
  - **Web Tier**: Allows HTTP/HTTPS from anywhere.
  - **App Tier**: Allows traffic from the Web security group.
  - **Database Tier**: Allows traffic from the App security group.
- Outputs:
  - Security Group IDs

---

### 🔹 Compute Module
- Defines Launch Templates for Web and App EC2 instances.
- Configures Auto Scaling Groups for both tiers in their respective subnets.
- Creates Target Groups for integration with the ALB.
- Outputs:
  - Target Group ARNs

---

### 🔹 ALB Module
- Deploys:
  - Public ALB for the Web Tier.
  - Private ALB for the App Tier.
- Sets up HTTP and HTTPS Listeners (requires SSL certificate for HTTPS).
- Associates Target Groups with Listeners.
- Outputs:
  - ALB DNS Names
  - Listener ARNs

---

### 🔹 RDS Module
- Creates a subnet group for the RDS instance.
- Provisions an RDS instance in private subnets.
- Configures:
  - Engine, version, storage, credentials.
- Outputs:
  - RDS Endpoint
  - DB Username

---

## Configuration Files

### `main.tf`
- Invokes all modules in the required order.
- Passes outputs from one module to another.
- Manages interdependencies like VPC and Subnets.

### `variables.tf`
- Declares input variables.
- Includes default values for:
  - Region
  - CIDR blocks
  - Instance types
- Handles sensitive variables (e.g., DB credentials).

### `outputs.tf`
- Defines outputs such as ALB DNS and RDS endpoints.
- Marks sensitive outputs as protected.

### `terraform.tfvars`
- Provides specific values for input variables.
- Can include sensitive values (use caution in production).

### `provider.tf`
- Configures:
  - AWS provider
  - Terraform version constraints
  - (Optional) Remote backend for state management


## Summary

This Terraform project offers a robust, modular, and secure foundation for deploying a multi-tier application on AWS. It automates the provisioning of essential infrastructure components, including:

- Networking
- Security
- Compute resources
- Load balancing
- Database services

By adhering to the provided structure and best practices, this setup ensures that your application environment is easy to manage, scalable, and secure.

# Follow these steps to deploy the infrastructure:

### 1. Initialize Terraform
```bash
terraform init
```
### 2. Review the Execution Plan
```bash
terraform plan
```
### 3. Apply the Configuration
```bash
terraform apply auto-approve
```
![WhatsApp Image 2025-05-29 at 17 24 44_58586ca4](https://github.com/user-attachments/assets/3d42df35-9f7d-4c1b-bf29-9fe22a9b09e2)

![WhatsApp Image 2025-05-29 at 17 25 52_4f61dd8e](https://github.com/user-attachments/assets/a140d874-05aa-4d7d-b834-d2254d503ab9)

![WhatsApp Image 2025-05-29 at 17 26 46_6bc584eb](https://github.com/user-attachments/assets/bcf0af7a-7996-4c92-8f2b-7a78f76434aa)

![WhatsApp Image 2025-05-29 at 17 28 51_cf5e123a](https://github.com/user-attachments/assets/e442029c-05be-4b11-a328-a8d46c1939f4)



