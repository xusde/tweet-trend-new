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
                echo "----------- build started ----------"
                sh 'mvn clean deploy -Dmaven.test.skip=true'
                echo "----------- build completed ----------"
            }
        }

        stage('Test') {
            steps {
                echo "----------- test started ----------"
                sh 'mvn surefire-report:report'
                echo "----------- test completed ----------"
            }
        }

    }
}
