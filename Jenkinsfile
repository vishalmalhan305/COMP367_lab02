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
                bat  'mvn clean install'
            }
        }
        
        stage("Unit test") {
            steps {
                bat  'mvn test'
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
                    sh 'docker build -t vishalmalhan/mavenwebproject:latest .'
                }
            }
        }

        stage("Docker Push") {
            steps {
                script {
                    sh 'docker push vishalmalhan/mavenwebproject:latest'
                }
            }
        }
    }
}
