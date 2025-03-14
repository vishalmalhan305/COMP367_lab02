pipeline {
    agent any

    tools {
        maven "Maven"
    }

    environment {
        DOCKERHUB_PWD = credentials('CredentialID_DockerHubPWD')
    }

    stages {
        stage("Checkout") {
            steps {
                git branch: 'main', url: 'https://github.com/vishalmalhan305/COMP367_lab02'
            }
        }

        stage("Build & Test") {
            parallel {
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
            }
        }

        stage("Docker Build & Push") {
            steps {
                script {
                    sh 'echo ${DOCKERHUB_PWD} | docker login -u vishalmalhan --password-stdin'
                    sh 'docker build -t vishalmalhan/mavenwebapp:latest .'
                    sh 'docker push vishalmalhan/mavenwebapp:latest'
                }
            }
        }
    }

    post {
        success {
            echo "Pipeline completed successfully!"
        }
        failure {
            echo "Pipeline failed! Check logs."
        }
    }
}
