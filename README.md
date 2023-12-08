This is a personal project for integrating Ansible and Terraform practice into learning Jenkins by using IAC tools to deploy a Jenkins contoller and Docker agent in AWS

# Creates:
- 2 EC2 t2.micro ubuntu instances on AWS with ssh and http permissions
- SSH keypair for EC2 instances

# Configures:
- Jenkins controller clean install with first-time login password output
- Docker Engine install and configuration for Jenkins to use Docker server as a host for running Agents

# Notes:
Rename inventory.template -> inventory
- modify IP addresses to match your servers
- modify SSH keypair location to match your local setup