pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building the application...'
                // Add your build steps here (e.g., Docker build)
                sh 'docker build -t snake-game-app .'
            }
        }

        stage('Test') {
            steps {
                echo 'Testing the application...'
                // Add your test commands here (e.g., Docker test scripts or unit tests)
                sh 'echo "No tests configured, skipping..."'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying the application...'
                // Deploy the Docker container
                sh 'docker run -d -p 8080:80 snake-game-app'
            }
        }
    }

    post {
        always {
            echo 'Pipeline execution finished.'
        }
        success {
            echo 'Pipeline completed successfully.'
        }
        failure {
            echo 'Pipeline failed. Please check the logs for errors.'
        }
    }
}