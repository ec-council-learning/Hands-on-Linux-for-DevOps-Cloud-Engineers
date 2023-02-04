# contains variables used in the other tf files.

variable "AWS_REGION" {
  default = "us-west-2"
}

# AZ we will use for lab
variable "AZ" {
  default = "us-west-2a"
}

# Use current directory for private key file
variable "PRIVATE_KEY_PATH" {
  default = "lab-key-pair"
}

# Use current directory for public key file
variable "PUBLIC_KEY_PATH" {
  default = "lab-key-pair.pub"
}

# Default Linux base image we will use (Amazon Linux 2)
variable "AMI" {
  default = "ami-094125af156557ca2"
}
