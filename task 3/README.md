# TASK 3
# Modular AWS Infrastructure Using Terraform

This project showcases a modular method for provisioning AWS infrastructure with Terraform. It is designed to support multiple environments (`dev`, `prod`, and `test`) while emphasizing reusability, clarity, and scalability.

---




# Root Structure
```bash
task-3/
├── modules/                     # Reusable Terraform modules
│   ├── ec2/
│   ├── eip/
│   ├── igw/
│   ├── nat/
│   ├── s3/
│   ├── sg/
│   ├── subnet/
│   └── vpc/
│
├── dev/                         # Development environment configuration
│   ├── backend.tf
│   ├── local.tf
│   ├── main.tf
│   ├── output.tf
│   ├── provider.tf
│   ├── terraform.tfvars
│   └── variables.tf
│
├── prod/                        # Production environment configuration
│   ├── backend.tf
│   ├── local.tf
│   ├── main.tf
│   ├── output.tf
│   ├── provider.tf
│   ├── terraform.tfvars
│   └── variables.tf
│
└── test/                        # Testing environment configuration
    ├── backend.tf
    ├── local.tf
    ├── main.tf
    ├── output.tf
    ├── provider.tf
    ├── terraform.tfvars
    └── variables.tf
```

# Module Structure
Here is the structure used for each module (ec2, eip, nat, etc.) within the "module" directory:
```bash
modules/
└── module_name(ec2)/                     # EC2 instance module
    ├── main.tf              # Resource definitions
    ├── variables.tf         # Input variable declarations
    └── output.tf            # Output values
```
#  Environment-Specific Files

Each environment directory (`dev`, `prod`, `test`) contains its own set of Terraform configuration files tailored to that environment.

### - `{env_name}.tfvars`
Defines concrete values for the variables declared in `variables.tf`. These values are environment-specific, ensuring that each setup (development, production, testing) behaves according to its intended purpose.

![WhatsApp Image 2025-05-11 at 01 58 16_3fc00235](https://github.com/user-attachments/assets/05a7c2ab-47cf-4ac6-bf74-b90553fd0a81)
