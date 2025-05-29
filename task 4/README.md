# TASK-4  
# Multi-Region AWS Infrastructure with Terraform

##  Resources to be Created in This Task

###  Infrastructure Overview
- **Region**: Single AWS Region  
- **Availability Zones**: Two AZs for high availability  

###  VPC & Subnet Layout
- **VPC**: One custom Virtual Private Cloud
- **Subnets**:
  - **Web Tier**: Public Subnet in each AZ  
  - **App Tier**: Private Subnet in each AZ  
  - **DB Tier**: Private Subnet in each AZ  

###  Networking Components
- Internet Gateway (attached to the VPC)  
- NAT Gateway in each Public Subnet  
- Individual Route Tables per Subnet  
- Routing Rules:
  - Public Subnets → Internet Gateway  
  - Private Subnets → NAT Gateway  

###  Compute Resources
- **Launch Templates** to define EC2 instance settings  
- **Auto Scaling Groups**:
  - Web Tier (Frontend EC2 instances)  
  - App Tier (Backend EC2 instances)  

###  Load Balancing Setup
- Public ALB for the Web Tier  
- Private ALB for the App Tier  
- Configured with HTTP/HTTPS listeners & rules  
- Target Groups for each Auto Scaling Group  

###  EC2 Instance Details
- AMI, Instance Type, and SSH Key Pair  
- Tier-based network configuration (Web, App, DB)



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
