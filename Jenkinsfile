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
        
        stage("Docker build") {
            steps {
                script {
                    bat  'docker build -t vishalmalhan/mavenproject:latest .'
                }
            }
        }
        
        stage("Docker login & push") {
            steps {
                script {
                    bat  'docker login -u vishalmalhan -p ${DOCKERHUB_PWD}'
                    bat  'docker push vishalmalhan/mavenproject:latest'
                }
            }
        }
    }
}
