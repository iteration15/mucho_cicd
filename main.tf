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
    yum update -y
    amazon-linux-extras install docker -y
    service docker start
    usermod -a -G docker ec2-user
    curl -L https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
  EOF

  connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = "${file("~/.ssh/mucho_cicd.pem")}"
      host        = "${self.public_ip}"
    }

  provisioner "remote-exec" {
    inline = [
      "sudo amazon-linux-extras install ansible2 -y",
      "sudo yum install git -y"
    ]
  }
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
