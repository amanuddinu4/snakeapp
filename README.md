Snake Game Deployment Pipeline<br>

Purpose<br>

This pipeline automates the build, deployment, and hosting of the Snake Game application using Jenkins and Docker. It ensures efficiency, consistency, and reproducibility across deployments.<br>

Prerequisites<br>

Jenkins Installation:<br>
Ensure Jenkins is installed and configured on the server<br>
Docker Installation:<br>
Install Docker and start the Docker daemon.<br>

Source Code Repository:<br>

The application code must be available on a Git repository<br>
(https://github.com/amanuddinu4/snakeapp)<br>

Pipeline Script:<br>

Use the provided Jenkins Pipeline script (Declarative syntax).<br>

Dockerfile:<br>

Create a Docerfile in the application directory with the following content:<br>

FROM nginx:alpine<br>
COPY dist /usr/share/nginx/html<br>
EXPOSE 80<br>

Pipeline Workflow :<br>

The pipeline follows these stages:<br>

1.Checkout<br>

Task: Retrieves the latest version of the code from the  branch of the GitHub repository.<br>
Command:<br>
git url: 'https://github.com/amanuddinu4/snakeapp', branch: 'main'<br>

2.Build Docker Image<br>

Task: Builds a Docker image for the application.<br>
Command:<br>
sudo docker build -t snake-game:latest .<br>
Output: A new Docker image tagged snake-game:latest.<br>

3.Run Docker Container<br>

Task: Stops and removes any existing Docker container named , then runs a new container using the updated image.<br>
Commands:<br>
sudo docker stop snake-game || true<br>
sudo docker rm snake-game || true<br>
sudo docker run -d -p 8081:80 --name snake-game snake-game:latest<br>

Details:<br>

Port Mapping: Maps port 8081 on the host to port 80 inside the container.<br>
Container Name: snake-game.<br>

Post Deployment :<br>

Task: Displays a success message upon successful deployment.<br>
Command:<br>
echo 'Deployment completed successfully!'<br>

Failure Handling :<br>

Post Condition:<br>

If any stage fails, the pipeline outputs an error message:<br>
echo 'Deployment failed!'<br>

Pipeline Script :<br>

Below is the complete pipeline script:<br>

pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from your Git repository
                git url: 'https://github.com/amanuddinu4/snakeapp', branch: 'main'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    sh 'sudo docker build -t snake-game:latest .'
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Stop any running container with the same name
                    sh 'sudo docker stop snake-game || true'
                    sh 'sudo docker rm snake-game || true'

                    // Run the Docker container
                    sh 'sudo docker run -d -p 8081:80 --name snake-game snake-game:latest'
                }
            }
        }

        stage('Post Deployment') {
            steps {
                echo 'Deployment completed successfully!'
            }
        }
    }

    post {
        failure {
            echo 'Deployment failed!'
        }
    }
}
<br>
Accessing the Application:<br>

After deployment, the Snake Game can be accessed via:<br>

http://<host_ip>:8081
