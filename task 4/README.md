#  TASK-4
#  Terraform AWS Multi-Region Infrastructure

## This task requires us to create the following resources 

- **Region**: 1  
- **Availability Zones**: 2  
- **VPC**: 1  
- **Subnets**:
  - 1 Public Subnet per AZ (Web Tier)
  - 1 Private Subnet per AZ (App Tier)
  - 1 Private Subnet per AZ (DB Tier)

- **Networking**:
  - Internet Gateway with VPC Attachment
  - NAT Gateway in each Public Subnet
  - Route Tables per Subnet
  - Routes for IGW (public) & NAT GW (private)

- **Compute**:
  - Launch Templates
  - Auto Scaling Groups for Frontend & Backend EC2 instances

- **Load Balancer**:
  - Public ALB for Web Tier
  - Private ALB for App Tier
  - HTTP/HTTPS Listeners & Rules
  - Target Groups for ASGs

- **EC2**:
  - AMI, Instance Type, SSH Key Pair
  - Network configuration based on tier


---

##  Project Structure

The Structure looks like:

```bash
├── .task 4/                      # Terraform working directory (auto-generated)
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
├── README.md                        # Project documentation
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
