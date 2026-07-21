pipeline {
    agent {
        node {
            label "maven"
        }
    }

    stages {
        stage('Clone Source Code') {
            steps {
                git branch: 'main', url: 'https://github.com/xusde/tweet-trend-new.git'
            }
        }
    }
}
