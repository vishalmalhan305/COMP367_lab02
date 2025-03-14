pipeline {
    agent any

    tools {
        // Install Maven
        maven "Maven"
    }

    environment {
        // Store DockerHub password in Jenkins Credentials
        DOCKERHUB_PWD = credentials('CredentialID_DockerHubPWD')
    }

    stages {
        stage("Checkout") {
            steps {
                git branch: 'main', url: 'https://github.com/vishalmalhan305/COMP367_lab02'
            }
        }

        stage("Build Maven Project") {
            steps {
                sh 'mvn clean package'
            }
        }

        stage("Unit Test") {
            steps {
                sh 'mvn test'
            }
        }

        stage("Docker Login") {
            steps {
                script {
                    sh 'docker login -u vishalmalhan -p ${DOCKERHUB_PWD}'
                }
            }
        }

        stage("Docker Build") {
            steps {
                script {
                    sh 'docker build -t vishalmalhan/mavenwebapp:latest .'
                }
            }
        }

        stage("Docker Push") {
            steps {
                script {
                    sh 'docker push vishalmalhan/mavenwebapp:latest'
                }
            }
        }
    }
}
