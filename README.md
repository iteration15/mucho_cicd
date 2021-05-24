# mucho_cicd setup:

1. Create a key pair in AWS.
2. Update the "key_name" var in variables.tf.
3. 'terraform plan'
4. 'terraform apply'
5. 'ssh -i "~/.ssh/mucho_cicd.pem" ubuntu@[ec2-name]'
