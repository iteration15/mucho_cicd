terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.12.0"
    }
  }
}

provider "aws" {
  region = var.ec2_region
}

provider "docker" {
  host = "tcp://docker:2345/"
}
