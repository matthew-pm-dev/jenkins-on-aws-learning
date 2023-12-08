# Generate SSH Private Key
resource "tls_private_key" "mpm_jenkins_pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Generate SSH KeyPair
resource "aws_key_pair" "mpm_jenkins_keypair" {
  key_name   = var.ssh_admin_key
  public_key = tls_private_key.mpm_jenkins_pk.public_key_openssh
}

# Save key to .pem file
resource "local_file" "key_local_file" {
  content         = tls_private_key.mpm_jenkins_pk.private_key_pem
  filename        = "${var.ssh_admin_key}.pem"
  file_permission = 0400
}


# Security group rules for SSH access and http(s) on p8080
resource "aws_security_group" "allow_http_ssh" {
  name        = "allow_http"
  description = "Allow http inbound traffic"


  ingress {
    description = "http"
    from_port   = 80
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
 
  }
ingress {
    description = "ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
 
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


  tags = {
    Name = "allow_http_ssh"
  }
}