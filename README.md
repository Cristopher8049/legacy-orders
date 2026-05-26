# Legacy Application Deployment

## Description

This project implements a CI/CD pipeline for a legacy Node.js application using GitHub Actions, Terraform and AWS Academy Learner Lab.

## CI Pipeline

The CI pipeline runs on the `develop` branch. It installs Node.js 20, installs dependencies, runs automated tests and packages the application as an artifact when the tests pass.

## CD Pipeline

The CD pipeline runs on the `main` branch. It configures AWS credentials using GitHub Secrets, installs Terraform, initializes the S3 backend, creates the Terraform plan and applies the infrastructure automatically.

## Infrastructure

The infrastructure is defined using Terraform with a modular structure:

- `network` module: creates the Security Group and allows inbound traffic only on the assigned application port.
- `compute` module: creates an EC2 instance using Amazon Linux 2023 and starts the Node.js application using user_data.

## AWS Region

```text
us-east-1