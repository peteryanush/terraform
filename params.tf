# parms file for aws ec2 cloud

#### AMI

# Set ec2 image AMI
variable "ami" {
  # Drakontas Centos-7 CentOS-7 ami-029821b05e46af7ec
  default = "ami-04cf43aca3e6f3de3"
}

#### VPC Network
variable "vpc_cidr" {
  default = "192.168.0.0/16"
}

#### NETWORK PARAMS
variable "network_http" {
  default = {
    subnet_name = "subnet_http"
    cidr        = "192.168.1.0/24"
  }
}

# Set number of instance
variable "desired_capacity_http" {
  default = 4
}

# Set number of instance
variable "desired_capacity_db" {
  default = 3
}
