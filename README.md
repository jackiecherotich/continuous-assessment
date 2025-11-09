# Terraform & Ansible Automation Project

This project automates the deployment of an **Ubuntu EC2 instance on AWS
using Terraform**, followed by **installation and configuration of
Docker and Nginx using Ansible**.\
It also integrates a **CI/CD pipeline using CircleCI** for automated
deployments.

## 1. Infrastructure Setup (Terraform)

-   Create AWS VPC with CIDR `10.0.0.0/27`
-   Create Public and Private Subnets
-   Configure Internet Gateway for internet access
-   Set up security groups for SSH (22), HTTP (80), and 8080
-   Automatically provision Ubuntu 22.04 EC2 instance
-   Assign an Elastic IP
-   Generate dynamic Ansible inventory

## Required Tools

-   AWS Account
-   Terraform v1.6.3-dev
-   Ansible v2.19.3
-   AWS CLI configured with Access Key & Secret Key
-   SSH Key Pair

## Project Structure

### Initialize Terraform

    "cd cloud-automation"
    "terraform init"

### Validate & Plan

    "terraform validate"
    "terraform plan"

### Apply Infrastructure

    "terraform apply"

### Terraform provisions:

1.  Custom VPC
2.  EC2 instance
3.  Dynamic Ansible inventory

## 2. Server Configuration (Ansible)

### Nginx

-   Latest version
-   Enabled & running
-   Accessible on port 80

### Docker

-   Docker CE
-   Docker CLI
-   Docker Compose plugin

### System Packages

-   apt-transport-https
-   ca-certificates
-   curl
-   gnupg
-   lsb-release
-   software-properties-common

## 3. CI/CD Integration with CircleCI

A fully automated CI/CD pipeline builds, deploys, and verifies the
application.

### Required CircleCI Environment Variables

-   AWS_ACCESS_KEY_ID
-   AWS_SECRET_ACCESS_KEY
-   AWS_DEFAULT_REGION

### Pipeline Workflow

1.  Triggered on push to `main`
2.  SSH to EC2 instance
3.  Copy app files
4.  Build Docker image
5.  Replace running container
6.  Verify deployment

### Deploying Updates

    git add web-app/
    git commit -m "Updates on the web app"
    git push origin main

### Manual Trigger

Use CircleCI dashboard → **continuous-assessment** → *Rerun Workflow*

## Monitoring

-   View logs in CircleCI pipeline interface

## Checking Application on EC2

    ssh -i ec2-instance-key.pem ubuntu@<instance_ip>
    docker ps

## Accessing the Web Application

    http://<instance_ip>:8080

## Cleanup

## terraform destroy

Destroys EC2 instance, VPC, Internet Gateway , Security groups
