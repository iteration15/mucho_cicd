resource "random_pet" "name" {}

resource "aws_instance" "web" {
   ami = var.ec2_ami
   instance_type = var.ec2_type
   vpc_security_group_ids = [aws_security_group.web-sg.id]
   key_name = "mucho_cicd"
   tags = {
    Name = random_pet.name.id
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
