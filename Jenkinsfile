pipeline {
    agent any
    environment {
        MAVEN_HOME = "C:\\maven"
        PATH = "${MAVEN_HOME}\\bin;${env.PATH}"
    }
    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from your repository
                checkout scm
            }
        }
        stage('Build') {
            steps {
                // Run Maven build
                script {
                    bat 'mvn clean install'
                }
            }
        }
        stage('Test') {
            steps {
                // Run Maven test
                script {
                    bat 'mvn test'
                }
            }
        }
        stage('Deploy') {
            steps {
                // Deploy the application (if needed)
                echo 'Deploying application...'
            }
        }
    }
    post {
        always {
            // Cleanup steps (if any)
            echo 'Cleaning up...'
        }
        success {
            // Notify on success (optional)
            echo 'Build succeeded!'
        }
        failure {
            // Notify on failure (optional)
            echo 'Build failed!'
        }
    }
}
