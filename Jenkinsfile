pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                echo 'Pulling code from Git repository...'
                sh 'git clone https://github.com/amanuddinu4/snakeapp.git .'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building the Docker image...'
                sh 'docker build . -t snakegame' // Remove 'sh' before the Docker command
            }
        }

        stage('Deploy Application') {
            steps {
                echo 'Deploying the application...'
                sh 'docker run -d -p 8080:80 snakegame' // Run the Docker container
            }
        }
    }

    post {
        always {
            echo 'Pipeline execution finished.'
        }
        success {
            echo 'Application deployed successfully. You can access it at http://localhost:8080.'
        }
        failure {
            echo 'Pipeline failed. Check the logs to debug the issue.'
        }
    }
}
