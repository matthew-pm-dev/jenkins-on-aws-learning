variable "ssh_admin_key" {
  description = "Default SSH key for EC2 admin"
  type        = string
  default     = "mpm_jenkins_key"
}