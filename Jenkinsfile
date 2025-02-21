pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: '<your_repo_url>'
            }
        }
        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
    }
}
