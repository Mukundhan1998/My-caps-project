pipeline {
    agent any

    environment {
        BRANCH_NAME = "${env.BRANCH_NAME}"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Execution permission to scripts') {
            steps {
                sh '''
                    chmod +x build.sh
                    chmod +x deploy.sh
                '''
            }
        }

        stage('Build & Push Docker Image') {
            steps {
                sh './build.sh'
            }
        }

        stage('Pull the pushed image and Deploy to EC2') {
            steps {
                sh '''
                    scp -o StrictHostKeyChecking=no -i /var/lib/jenkins/.ssh/don1.pem deploy.sh ubuntu@54.151.193.180:/home/ubuntu/
                    
                    ssh -o StrictHostKeyChecking=no -i /var/lib/jenkins/.ssh/don1.pem ubuntu@54.151.193.180 "BRANCH_NAME=$BRANCH_NAME bash deploy.sh"
                '''
            }
        }
    }
}