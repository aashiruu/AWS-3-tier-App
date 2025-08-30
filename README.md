# AWS-3-tier-App

# AWS 3-Tier Application Infrastructure

A complete infrastructure-as-code (IaC) project demonstrating a classic 3-tier architecture on AWS using Terraform. The project provisions a secure, scalable environment with a public web tier, a private application tier, and a data tier using S3.

## Architecture Overview

![3-Tier Architecture Diagram](https://raw.githubusercontent.com/aws-samples/aws-refarch-wordpress/master/images/aws-refarch-wordpress-v20170915.png)
*(Note: Replace with your own diagram. This is a placeholder link.)*

The architecture consists of:

1.  **Presentation/Web Tier:**
    *   Ubuntu EC2 instance in a public subnet.
    *   Secured with a Security Group allowing HTTP/HTTPS and restricted SSH.
    *   Hosts an NGINX web server.

2.  **Application/Logic Tier:**
    *   Ubuntu EC2 instance in a private subnet.
    *   Secured with a Security Group that only allows traffic from the Web Tier.
    *   Hosts a Python Flask application.

3.  **Data Tier:**
    *   Amazon S3 bucket for storing and serving static assets.
    *   All public access is blocked by default (secure by design).

4.  **Security & Identity:**
    *   **IAM Roles:** EC2 instances are granted least-privilege access to S3 via an IAM Role.
    *   **Security Groups:** Act as firewalls to strictly control traffic between tiers.
    *   **Network ACLs & Subnets:** Public and private subnets provide network-level isolation.

## Prerequisites

Before using this Terraform code, ensure you have the following:

1.  **An AWS Account:** With programmatic access.
2.  **AWS CLI:** Installed and configured with your credentials (`aws configure`).
3.  **Terraform:** Version 1.0 or newer installed.
4.  **An EC2 Key Pair:** Created in your AWS console in the region you plan to use (e.g., `us-east-1`). This is required for SSH access.

## Usage

### 1. Clone the Repository
```bash
git clone https://github.com/<your-username>/aws-3-tier-app.git
cd aws-3-tier-app/terraform
```
2. Initialize Terraform

This command downloads the necessary AWS provider plugins.

```bash
terraform init
```

3. Review the Execution Plan

See what resources Terraform will create without applying any changes.

```bash
terraform plan
```

4. Deploy the Infrastructure

Apply the configuration to create all AWS resources. Type yes when prompted.

```bash
terraform apply
```

5. Test the Deployment

After successful deployment, Terraform will output the public IP of the web server.

· Open your browser and navigate to: http://<WEB_SERVER_PUBLIC_IP>
· Test the app tier endpoint: http://<WEB_SERVER_PUBLIC_IP>:5000 (requires further NGINX configuration)
· Check the S3 console to see the created bucket and sample file.

6. Destroy Resources (Important!)

To avoid ongoing costs, always destroy the infrastructure when you are finished.

```bash
terraform destroy
```

Project Structure

```
aws-3-tier-app/
├── terraform/           # Terraform infrastructure code
│   ├── main.tf         # Primary resources (VPC, EC2, S3, SG)
│   ├── variables.tf    # Input variable definitions
│   ├── outputs.tf      # Output values (IPs, ARNs)
│   ├── providers.tf    # Terraform and AWS provider configuration
│   └── terraform.tfvars # Variable values (edit this file!)
├── scripts/            # User data scripts for EC2 bootstrapping
│   ├── setup-web.sh    # Installs NGINX on the Web Tier
│   └── setup-app.sh    # Installs Flask on the App Tier
├── web-app/            # Sample web application assets
│   ├── index.html
│   └── style.css
├── backend/            # Sample application tier code
│   ├── app.py
│   └── requirements.txt
├── .gitignore         # Files to ignore in Git
└── README.md          # This file
```

Customization

1. Edit terraform/terraform.tfvars:
   · Set key_pair_name to your existing EC2 Key Pair name.
   · Set s3_bucket_name to a globally unique name for your bucket.
2. Edit variables.tf:
   · Modify aws_region, instance_type, or CIDR blocks to suit your needs.
