pipeline {
    agent any
    
    tools {
        maven "Maven"
    }
    
    environment {
        DOCKERHUB_PWD = credentials('CredentialID_DockerHubPWD')
    }
    
    stages {
        stage("Check out") {
            steps {
                git branch: 'main', url: 'https://github.com/vishalmalhan305/COMP367_lab02'
            }
        }
        
        stage("Build Maven project") {
            steps {
                bat 'mvn clean install'
            }
        }
        
        stage("Unit test") {
            steps {
                bat 'mvn test'
            }
        }
        
        stage("Docker build") {
            steps {
                bat 'docker build -t vishalmalhan/mavenproject:latest .'
            }
        }
        
        stage("Docker login & push") {
            steps {
                script {
                    withCredentials([string(credentialsId: 'CredentialID_DockerHubPWD', variable: 'DOCKERHUB_PWD')]) {
                        bat 'echo %DOCKERHUB_PWD% | docker login -u vishalmalhan --password-stdin'
                    }
                    bat 'docker push vishalmalhan/mavenproject:latest'
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline execution completed.'
        }
        failure {
            echo 'Build or deployment failed. Check logs.'
        }
    }
}
