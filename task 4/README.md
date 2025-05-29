# TASK-4  
# Multi-Region AWS Infrastructure with Terraform

## This task requires us to create the following resources:

- **Region**: 1  
- **Availability Zones**: 2  

- **VPC**:  
  - 1 Virtual Private Cloud

- **Subnets**:  
  - 1 Public Subnet per AZ (Web Tier)  
  - 1 Private Subnet per AZ (App Tier)  
  - 1 Private Subnet per AZ (DB Tier)

- **Networking**:  
  - Internet Gateway with VPC Attachment  
  - NAT Gateway in each Public Subnet  
  - Route Tables for each Subnet  
  - Routes configured for:
    - IGW in Public Subnets  
    - NAT Gateway in Private Subnets  

- **Compute**:  
  - Launch Templates for EC2 configuration  
  - Auto Scaling Groups:
    - Frontend EC2 instances (Web Tier)  
    - Backend EC2 instances (App Tier)

- **Load Balancer**:  
  - Public Application Load Balancer for Web Tier  
  - Private Application Load Balancer for App Tier  
  - HTTP/HTTPS Listeners with Rules  
  - Target Groups linked to respective Auto Scaling Groups

- **EC2**:  
  - Amazon Machine Image (AMI), Instance Type, and SSH Key Pair  
  - Network configuration based on application tier (Web/App/DB)

---


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
##  Key Benefits

###  Multi-AZ Deployment
- Increases **high availability** and **resilience**
- Reduces downtime due to **AZ failures**
- Enables **automatic failover** for critical services (e.g., RDS)

###  Modular Design
- Encourages **code reuse**
- Makes infrastructure **easier to maintain**
- Simplifies updates to individual components (e.g., ALB, RDS)


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
