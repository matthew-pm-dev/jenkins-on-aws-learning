terraform {

  backend "local" {
    path = "terraform.tfstate"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# Create EC2 instance for Jekins Controller
resource "aws_instance" "jenkins_controller" {
  ami             = "ami-0fc5d935ebf8bc3bc"
  instance_type   = "t2.micro"

  key_name        = var.ssh_admin_key
  security_groups = [aws_security_group.allow_http.name, aws_security_group.allow_ssh.name]

  tags = {
    Name = "Jenkins_Controller"
  }
}

# Create EC2 instance for Docker Engine to be used for Jenkins Agents
resource "aws_instance" "jenkins_docker_host" {
  ami             = "ami-0fc5d935ebf8bc3bc"
  instance_type   = "t2.micro"

  key_name        = var.ssh_admin_key
  security_groups = [aws_security_group.allow_ssh.name]

  tags = {
    Name = "Jenkins_Docker_Host"
  }
}

# Create EC2 instance for Chef-Server
resource "aws_instance" "chef_server" {
  count           = var.chef_flag ? 1 : 0
  ami             = "ami-0fc5d935ebf8bc3bc"
  instance_type   = "t2.micro"

  key_name        = var.ssh_admin_key
  security_groups = [aws_security_group.allow_http.name, aws_security_group.allow_ssh.name]

  tags = {
    Name = "Chef_Server"
  }
}
