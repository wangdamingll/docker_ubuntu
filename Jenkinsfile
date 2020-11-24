pipeline {
  agent any
  stages {
    stage('test') {
      steps {
        sh '''#!/bin/bash
./ubuntu_env.sh build '''
      }
    }

  }
}