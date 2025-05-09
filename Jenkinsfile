pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/Astonie/techday-cicd.git', branch: 'main'
            }
        }
        stage('Build and Run') {
            steps {
                script {
                    docker.image('python:3.9-slim').inside {
                        sh 'python app.py'
                    }
                }
            }
        }
    }
}
