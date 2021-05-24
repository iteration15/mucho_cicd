resource "random_pet" "name" {}

resource "aws_instance" "web" {
   ami = var.ec2_ami
   instance_type = var.ec2_type
   vpc_security_group_ids = [aws_security_group.web-sg.id]
   key_name = var.key_name
   tags = {
    Name = var.ec2_name
  }

  user_data = <<-EOF
    #!/bin/bash
    set -ex
    sudo yum update -y
    sudo amazon-linux-extras install docker -y
    sudo service docker start
    sudo usermod -a -G docker ec2-user
    sudo curl -L https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
  EOF
}

resource "aws_security_group" "web-sg" {
  name = "${random_pet.name.id}-sg"
  ingress {
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
}

#create a repo to store containers
resource "aws_ecr_repository" "web-ecr" {
  name = "${random_pet.name.id}-sg"
  image_tag_mutability = "MUTABLE"

  tags = {
    project = random_pet.name.id
  }
}
