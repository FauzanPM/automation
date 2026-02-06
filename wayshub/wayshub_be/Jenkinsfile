def branch = "main"
def remote = "origin"
def directory = "~/dumbwaysapp/wayshub-backend"
def server = "genabc@103.103.23.200"
def cred = "devops"
def imageName = "wayshub-be"
def containerName = "wayshub-be"

pipeline {
    agent any

	triggers {
                githubPush()
        }

    stages {

        stage('repo pull') {
            steps {
                sshagent([cred]) {
                    sh """ssh -o StrictHostKeyChecking=no ${server} << EOF
                    cd ${directory}
                    git pull ${remote} ${branch}
                    exit
                    EOF"""
                }
            }
        }

        stage('docker build') {
            steps {
                sshagent([cred]) {
                    sh """ssh -o StrictHostKeyChecking=no ${server} << EOF
                    cd ${directory}
                    docker build -t ${imageName} .
                    exit
                    EOF"""
                }
            }
        }

        stage('stop & remove container') {
            steps {
                sshagent([cred]) {
                    sh """ssh -o StrictHostKeyChecking=no ${server} << EOF
                    docker stop ${containerName} || true
                    docker rm ${containerName} || true
                    exit
                    EOF"""
                }
            }
        }

        stage('docker run') {
            steps {
                sshagent([cred]) {
                    sh """ssh -o StrictHostKeyChecking=no ${server} << EOF
                    docker run -d \\
                    -p 5000:5000 \\
                    --name ${containerName} \\
                    ${imageName}
                    exit
                    EOF"""
                }
            }
        }
        stage('db migrate') {
            steps {
                sshagent([cred]) {
                    sh """ssh -o StrictHostKeyChecking=no ${server} << EOF
                    docker exec ${containerName} npx sequelize db:migrate
                    exit
                    EOF"""
                }
            }
        }

    }
}
