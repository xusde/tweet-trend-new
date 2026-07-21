pipeline {
    agent {
        node {
            label "maven"
        }
    }

    environment {
        PATH = "/opt/apache-maven-3.9.16/bin:$PATH"
    }

    stages {
        stage('Build source code') {
            steps {
                sh 'mvn clean deploy'
            }
        }
    }
}