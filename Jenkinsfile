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
    stage('Install Ansible') {
      steps {
        sh "virtualenv --system-site-packages -p python3 ${WORKSPACE}/tools"
	withPythonEnv("${WORKSPACE}/tools/") {
	  sh "pip install --upgrade pip"
	  sh "pip install -r requirements.txt"
	}
      }	
    }
  }
}
