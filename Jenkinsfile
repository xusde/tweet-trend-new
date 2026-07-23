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

        // stage('Test') {
        //     steps {
        //         echo "----------- test started ----------"
        //         sh 'mvn surefire-report:report'
        //         echo "----------- test completed ----------"
        //     }
        // }

        // stage('SonarQube Analysis') {
        //     environment {
        //         SONAR_SCANNER_HOME = tool 'sonar-scanner'
        //     }
        //     steps {
        //         withSonarQubeEnv('sonar-server') {   // must match name from step 4
        //             sh 'mvn sonar:sonar'
        //             // sh "${SONAR_SCANNER_HOME}/bin/sonar-scanner"
        //         }
        //     }
        // }

        // stage('Quality Gate') {
        //     steps {
        //         timeout(time: 5, unit: 'MINUTES') {
        //             waitForQualityGate abortPipeline: true
        //         }
        //     }
        // }

        stage('Publish to Artifactory') {
            steps {
                rtServer (
                    id: 'artifactory-server',          // configured in Manage Jenkins > System
                    url: 'https://xusde.jfrog.io/artifactory',
                    credentialsId: 'jfrog_token'  // Jenkins credentials ID
                )
                rtMavenDeployer (
                    id: 'maven-deployer',
                    serverId: 'artifactory-server',
                    releaseRepo: 'libs-release-local',
                    snapshotRepo: 'libs-snapshot-local'
                )
                rtMavenResolver (
                    id: 'maven-resolver',
                    serverId: 'artifactory-server',
                    releaseRepo: 'libs-release',
                    snapshotRepo: 'libs-snapshot'
                )
                rtMavenRun (
                    // tool: 'maven',              // name of Maven install in Jenkins, or leave blank if on PATH
                    pom: 'pom.xml',
                    goals: 'clean install',
                    deployerId: 'maven-deployer',
                    resolverId: 'maven-resolver'
                )
                rtPublishBuildInfo (
                    serverId: 'artifactory-server'
                )
            }
        }

    }
}
