pipeline {
    agent any
    
    stages {
                stage('Checkout') {
            steps {
                echo 'Checkout the code from GitHub Repository'
            checkout changelog: false, poll: false, scm: scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Rohit2k00/devops-automation.git']])
            }
            
        }
        
        stage('Installing') {
            steps {
                echo 'Installing this application using Maven'
                sh 'mvn clean install'
            }
        }
        
        stage('build') {
            steps {
                echo 'Building Docker image from DockerFile'
                sh 'docker build -t rohitwasnik1112/devops-integration .'
            }
        }
        
        stage('push') {
            steps {
                echo 'Pushing code to the DockerHub'
                withCredentials([usernamePassword(credentialsId: 'a50eeb06-16c5-4b01-baab-cf314a262f65', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                sh 'docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD'
                sh 'docker push rohitwasnik1112/devops-integration'    
                }
                
            } 
        }
    }
}
