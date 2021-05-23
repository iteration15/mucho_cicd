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
  host = "npipe:////.//pipe//docker_engine"
}
