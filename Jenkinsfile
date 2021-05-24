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
  }












}
