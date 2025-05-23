# TASK 3
# Modular AWS Infrastructure Using Terraform

This project showcases a modular method for provisioning AWS infrastructure with Terraform. It is designed to support multiple environments (`dev`, `prod`, and `test`) while emphasizing reusability, clarity, and scalability.

---

# Root Structure
```bash
task 3/
|
|----------- modules/ # Reusable Terraform modules
| |---- ec2/ 
| |---- eip/ 
| |---- nat/ 
| |---- s3/ 
| |---- sg/ 
| |---- subnet/ 
| |---- vpc/ 
| |---- igw/
|----------- dev/ # Development environment configuration
| |---- main.tf 
| |---- variables.tf 
| |---- terraform.tfvars 
| |---- backend.tf 
| |---- provider.tf 
| |---- output.tf
| |---- local.tf
|
|----------- prod/ # Production environment
| |---- (same structure as dev/)
|
|----------- test/ # Testing environment
| |----(same structure as dev/)
```
# Module Structure
Here is the structure used for each module (ec2, eip, nat, etc.) within the "module" directory:
```bash
| |-------- ec2 (module name)
| |-- main.tf
| |-- output.tf
| |-- variables.tf
```
# File Structure

The `dev` environment (and also `prod` and `test`) includes the following seven mandatory Terraform configuration files:

## 1) `main.tf`
Defines the actual infrastructure by invoking reusable modules (like VPC, Subnet, EC2, etc.). This file serves as the blueprint for creating resources and establishing their relationships.

## 2) `variables.tf`
Specifies all input variables utilized across the environment's configuration, providing flexibility and enabling parameterization.

## 3) `terraform.tfvars`
ChatGPT said:
Provides specific values for the variables defined in variables.tf. Each environment (dev, prod, test) has its own set of values tailored to its requirements.

## 4) `backend.tf`
Specifies the remote backend configuration (such as S3 for state storage), allowing for consistent, shared, and secure management of the Terraform state.

## 5) `provider.tf`
Sets up the cloud provider (in this case, AWS), specifying details like the provider name, region, and required version to ensure consistent deployments.

## 6) `output.tf`
Defines and exposes key output values from the deployment (e.g., VPC ID, Subnet ID), which can be used by other configurations or for logging and reference purposes.

## 7) `local.tf`
It holds locally scoped values (such as environment name and app name) utilized to minimize duplication and build dynamic resource names and tags.

