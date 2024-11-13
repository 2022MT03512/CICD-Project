pipeline {
    agent {
        node {
            label 'maven'
        }
    }
    
    environment {
        PATH = "/opt/apache-maven-3.9.9/bin:$PATH"
        JENKINS_OPTS = "-Dorg.jenkinsci.plugins.durabletask.BourneShellScript.HEARTBEAT_CHECK_INTERVAL=86400"
    }

    stages {
        stage("Checkout") {
            steps {
                // Checkout the code from your repository
                checkout scm
            }
        }
        stage("build") {
            steps {
                echo "----------- build started ----------"
                sh 'mvn clean deploy -Dmaven.test.skip=true'
                echo "----------- build completed ----------"
            }
        }
        stage("test") {
            steps {
                echo "----------- unit test started ----------"
                sh 'mvn surefire-report:report'
                echo "----------- unit test completed ----------"
            }
        }
        stage('SonarQube analysis') {
            environment {
                scannerHome = tool 'bits-sonar-scanner'
            }
            steps {
                withSonarQubeEnv('bits-sonarqube-server') {
                    sh "${scannerHome}/bin/sonar-scanner"
                }
            }
        }
    }
}
