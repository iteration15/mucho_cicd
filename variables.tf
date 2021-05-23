variable "ec2_region" {
    description = "Deployment region"
    default     = "us-east-1"
}

variable "ec2_resource_group" {
    description = "Resource group to deploy ec2"
    default     = ""
}

variable "ec2_name" {
    description = "name of ec2"
    default     = "mucho_cicd"
}

variable "ec2_ami" {
    description = "AMI for Ubuntu 20.04"
    default     = "ami-09e67e426f25ce0d7"
}

variable "ec2_count" {
    description = "number of ec2s you want to create as part of this deployment"
    default     = 1
}

variable "ec2_type" {
    description = "size of the ec2"
    default     = "t2.micro"
}

variable "key_name" {
    description = "key name"
    default     = ""
}
