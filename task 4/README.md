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
## Key Benefits

### 1. Multi-AZ Deployment
- Enhances system **availability** and **fault tolerance**
- Minimizes the impact of **Availability Zone outages**
- Supports **automatic failover** for essential services such as RDS

### 2. Modular Design
- Promotes **reusability** across different environments and projects
- Improves **infrastructure manageability** and clarity
- Allows seamless **modification of individual components** like ALB or RDS without affecting the whole setup


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
