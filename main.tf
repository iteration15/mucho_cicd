resource "aws_instance" "mucho_cicd" {
   ami = var.ec2_ami
   instance_type = var.ec2_type
   monitoring = true

}
