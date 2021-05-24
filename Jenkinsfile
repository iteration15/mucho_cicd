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
        //need this: python3 -m pip install --user virtualenv
        sh "virtualenv --system-site-packages -p python3 ${WORKSPACE}/tools"
	withPythonEnv("${WORKSPACE}/tools/") {
	  sh "python3 -m pip install --upgrade pip"
	  sh "python3 -m pip install -r requirements.txt"
	}
      }	
    }
  }
}
