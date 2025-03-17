pipeline {
    agent any
    
    tools {
        maven "MAVEN3"
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
                sh 'mvn clean install'
            }
        }
        
        stage("Unit test") {
            steps {
                sh 'mvn test'
            }
        }
        
        stage("Docker build") {
            steps {
                script {
                    sh 'docker build -t vishalmalhan/mavenproject:latest .'
                }
            }
        }
        
        stage("Docker login & push") {
            steps {
                script {
                    sh 'docker login -u vishalmalhan -p ${DOCKERHUB_PWD}'
                    sh 'docker push vishalmalhan/mavenproject:latest'
                }
            }
        }
    }
}
