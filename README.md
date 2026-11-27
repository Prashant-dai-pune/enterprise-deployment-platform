# Enterprise Deployment Platform

A Terraform based AWS deployment platform organized around reusable modules, application stacks, and environment specific configuration.
## Progress

- [x] Terraform Project Structure
- [x] Reusable Modules
- [x] EC2 Deployment for App1
- [x] Security Groups (App1)
- [x] Application Load Balancer (App1)
- [ ] Auto Scaling Group integration
- [ ] GitHub Actions
- [x] Ansible playbook scaffold
- [ ] React Portal
- [ ] FastAPI Backend
- [ ] Kubernetes


## Overview

Enterprise Deployment Platform is a modular Infrastructure as Code (IaC) project that aims to provide a self-service deployment platform for AWS infrastructure.

The project separates reusable modules, application configurations, and environment-specific settings. The current App1 stack wires EC2, security groups, and an HTTP ALB together. Terraform configurations are available for `dev`, `stg`, and `prd`; each currently requests two App1 instances and uses the AWS default VPC when `vpc_id` is null. The root configuration uses an S3 backend with S3 native state locking.

---

## Current Status

### ✅ Completed

- Modular Terraform project structure
- Reusable Terraform modules
- Application-based deployment architecture
- Environment-specific configuration
- Remote state support
- Successfully provisioned EC2 instance for **App1** using the modular Terraform framework

### 🚧 In Progress

- Security Groups
- Application Load Balancer (ALB)
- Auto Scaling Group (ASG)
- GitHub Actions Integration
- Ansible Automation

### 📅 Planned

- React Self-Service Portal
- FastAPI Backend
- Kubernetes Integration
- AI-assisted Deployment Analysis
- Cost Optimization Dashboard

---

## Project Structure

```text
terraform/
├── applications/
│   └── app1/
├── modules/
│   ├── ec2/
│   ├── vpc/
│   ├── security-group/
│   └── alb/
├── environments/
│   ├── dev/
│   ├── stage/
│   └── prod/
└── scripts/
```

---

## Current Achievement

The current implementation validates the project architecture by successfully deploying an EC2 instance for **App1** through reusable Terraform modules. This demonstrates that the application-based structure, module design, and environment configuration are functioning as intended.

---

## Technology Stack

- Terraform
- AWS
- GitHub (Source Control)

Future additions:
- GitHub Actions
- Ansible
- FastAPI
- React
- Kubernetes
