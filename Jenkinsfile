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

        stage('Build Maven Project') {
            steps {
                // Run Maven build script
                script {
                    bat 'mvn clean install'
                }
            }
        }

        stage('Docker Login') {
            steps {
                // Log in to Docker Hub using Jenkins Credentials (only password stored in Jenkins)
                script {
                    withCredentials([usernamePassword(credentialsId: 'CredentialID_DockerHubPWD', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        // Pass password through stdin instead of using interpolation
                        sh """
                            echo ${DOCKER_PASSWORD} | docker login -u ${DOCKER_USERNAME} --password-stdin
                        """
                    }
                }
            }
        }

        stage('Docker Build') {
            steps {
                // Build Docker image from Dockerfile
                script {
                    docker.build("my-app:${env.BUILD_ID}")
                }
            }
        }

        stage('Docker Push') {
            steps {
                // Push the Docker image to Docker Hub
                script {
                    withCredentials([usernamePassword(credentialsId: 'CredentialID_DockerHubPWD', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        sh "docker push my-app:${env.BUILD_ID}"
                    }
                }
            }
        }
    }
    post {
        always {
            // Cleanup or post steps
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
