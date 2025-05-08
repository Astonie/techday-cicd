pipeline {
    agent {
        docker {
            image 'docker:20.10.24-dind'     // Docker daemon in container
            args '--privileged'             // Required to run Docker daemon
        }
    }

    environment {
        DOCKER_CREDENTIALS = credentials('dockerhub-creds')
    }

    stages {
        stage('SCM Checkout') {
            steps {
                git branch: 'main', credentialsId: 'github', url: 'https://github.com/Astonie/techday-cicd.git'
            }
        }

        stage('Start Docker Daemon') {
            steps {
                sh '''
                    dockerd-entrypoint.sh &  # Start Docker daemon
                    sleep 5                  # Wait for daemon to initialize
                '''
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t mukiwa/techday-cicd:$BUILD_NUMBER .'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying...'
            }
        }
    }

    post {
        always {
            echo 'This will always run after the stages.'
        }
    }
}
