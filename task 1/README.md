# TASK-1
# Terraform AWS EC2 Instance Configuration

This file provides a setup for creating an EC2 instance on AWS using Terraform. It uses variable values for flexibility, but you can also choose to hardcode these values instead.

---

##  Configurations

- Instance Type: t3.micro
- Operating System: Ubuntu (specified via AMI ID)
- Subnet: Defined by user-provided Subnet ID
- Public IP: Disabled
- Root EBS Volume: Expanded to 12 GB


---

## Step 1: Installation

###  Install AWS CLI

```bash
sudo apt update
sudo apt install awscli -y
aws --version
```
## Install Terraform  
### Open the powershell as an admin, then copy the following command on the command panel 
```bash
choco install terraform
```
---
## Step 2: Configure AWS CLI
```bash
aws configure
```
### the following will appear on your command panel after you type in "aws configure"
```bash
# - AWS Access Key
# - AWS Secret Key
# - Default region (e.g., us-east-1)
# - Output format (json)
```
## The Access Key is obtained by following the steps mentioned below: 

1. Log in to the **AWS Management Console**.
2. Click your **username (top right corner)**, then choose **"My Security Credentials."**
3. Scroll down and select **"Create New Access Key"** to generate a new access key pair.
4. Choose either **"Show Access Key"** to view the keys on-screen or **"Download Key File"** to save them as a `.csv` file.
5. The secret access key is displayed only once, so ensure you securely save the `.csv` file or copy the keys before closing.

   
---

## Step 3: File Setup 

 Your file structure should look like this
```bash

| File              | Purpose                                                                 |
|-------------------|-------------------------------------------------------------------------|
| `provider.tf`     | Specifies the AWS provider and credentials (access key and secret key are hardcoded).|
| `main.tf`         | Includes the EC2 instance resource block with all configurable parameters.   |
| `variables.tf`    | Declares all input variables used in `main.tf`                          |
| `terraform.tfvars`| Assigns values to the declared variables.                           |

```
---
## Step 4: Terraform Commands to execute the operation

### 1. Initialize the project
```bash
terraform init
```

### 2. Validate the configuration
```bash
terraform validate
```

### 3. Preview the changes
```bash
terraform plan
```

### 4.Apply the changes
```bash
terraform apply -auto-approve
```

### 5. Destroy resources (optional)
```bash
terraform destroy -auto-approve
```
![image](https://github.com/user-attachments/assets/c40c3d86-1d44-46c8-b4d0-51f550a38948)
![image](https://github.com/user-attachments/assets/734d6b79-199d-4122-88f8-870a1db4a865)
