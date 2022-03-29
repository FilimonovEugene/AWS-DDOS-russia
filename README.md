# AWS DDOS russian infrastructure

This repo automatically creates a set of a free-tier EC2 instances and start a DDOS attack using a list of target resources provided by Ukrainian IT army

# Prerequisites
- AWS account
- Terraform installed

# How to use
1. Create an AWS IAM user and generate Access Key and Secret Key;
2. Open variables.tf, update variables 'aws_access_key' and 'aws_secret_key' with the values you created;
3. Open terminal, navigate to the repo folder;
4. Execute these commands: "terraform init", "terraform apply";
5. If you need to re-create instances execute "terraform destroy" and then "terraform apply".