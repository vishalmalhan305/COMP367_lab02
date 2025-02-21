pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/vishalmalhan305/COMP367_lab02'
            }
        }
        stage('Build') {
            steps {
                bat 'mvn clean package'
            }
        }
    }
}