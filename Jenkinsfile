def getenv(String envname) {
  def result = readProperties file: '.env'
  return result[envname]
}
pipeline {
  agent {
    label "master"
  }
  stages {
    stage('Clean Workspace') {
      steps {
        sh "git clean -xdff"
      }
    }
    stage('Install Terraform') {
      steps {
        sh "mkdir ${WORKSPACE}/tools/"
        sh "curl -o ${WORKSPACE}/terraform.zip https://releases.hashicorp.com/terraform/0.12.18/terraform_0.12.18_linux_amd64.zip"
        sh "unzip -o -d ${WORKSPACE}/tools/bin/ ${WORKSPACE}/terraform.zip"
      }	
    }
    stage('Terraform Init') {
      steps {
        sh "${WORKSPACE}/tools/bin/terraform init -no-color"
    }
  }
}
