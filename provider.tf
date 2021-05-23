terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.0"
    }
    docker = {
      source = "kreuzwerker/docker"
      version = "2.12.0"
    }
  }
}

provider "aws" {
   region = "us-east-1"
}
