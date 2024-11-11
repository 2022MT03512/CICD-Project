pipeline {
    agent {label 'maven'}
    stages {
        stage('Clone') {
            steps {
                git branch: 'main', url: 'https://github.com/2022MT03512/CICD-Project.git'
            }
        }
    }
}
