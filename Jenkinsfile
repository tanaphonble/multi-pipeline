pipeline {
  environment {
    registry = 'tanaphonble/goapp'
    registryCredential = 'dockerhub'
    dockerImage = ''
  }

  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git branch: 'master'
            url: 'https://github.com/tanaphonble/multi-pipeline.git'
      }
    }
    stage('Build Image') {
      steps {
        script {
          dockerImage = docker.Build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage('Deploy Image') {
      steps {
        script {
          docker.withRegistry('', registryCredential) {
            dockerImage.push()
          }
        }
      }
    }
  }
}