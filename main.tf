
resource "aws_instance" "${var.ec2_name}" {
   ami = "${var.ec2_ami}"
   instance_type = "${var.ec2_type}"
}
