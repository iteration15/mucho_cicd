# mucho_cicd setup:

1. Create a key pair in AWS.
2. Update the "key_name" var in variables.tf.
3. 'terraform plan'
4. 'terraform apply'
5. 'ssh -i "~/.ssh/mucho_cicd.pem" ubuntu@[ec2-name]'
6. Create another ec2 called 'ansible'
7. ssh into ansible ec2.
8. 'sudo su'
9. 'yum update -y'
10. 'wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm'
11. 'yum install epel-release-latest-7.noarch.rpm'
12. 'yum update -y' (update the epel repo)
13. 'yum install git python python-devel python-pip openssl ansible -y'
14. 'ansible --version'
