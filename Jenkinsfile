pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                git(url: 'https://github.com/dev-hack95/devops_project_1', branch: 'main')
            }
        }
        
        stage('Sending Docker file to ansible server') {
            steps {
                sshagent(['ansible_server']) {
                    sh 'ssh -o StrictHostKeyChecking=no ubuntu@100.25.45.86'
                    sh 'scp /var/lib/jenkins/workspace/health_insurance_cross_sell_prediction/* ubuntu@100.25.45.86:/home/ubuntu/'
                }
            }
        }

        stage('Build docker image') {
            steps {
                sshagent(['ansible_server']) {
                    sh 'ssh -o StrictHostKeyChecking=no ubuntu@100.25.45.86 cd /home/ubuntu/'
                    sh 'ssh -o StrictHostKeyChecking=no ubuntu@100.25.45.86 sudo docker image build ./Dockefile . -t $JOB_NAME:$BUILD_ID'
                }
            }
        }

        stage('Check logs for docker image') {
            steps {
                sshagent(['ansible_server']) {
                    sh 'ssh -o StrictHostKeyChecking=no ubuntu@100.25.45.86 cd /home/ubuntu/'
                    sh 'ssh -o StrictHostKeyChecking=no ubuntu@100.25.43.86 sudo docker image list'
                }
            }
        }

        stage("Docker image tagging") {
            stage {
                sshagent(['ansible_server']) {
                    sh 'ssh -o StrictHostKeyChecking=no ubuntu@ip cd /home/ubuntu'
                    sh 'ssh -o StrictHostKeyChecking=no ubuntu@ip docker image tag $JOB_NAME:$BUILD_ID devhack95/$JOB_NAME:$BUILD_ID'
                    sh 'ssh -o StrictHostKeyChecking=no ubuntu@ip docker image tag $JOB_NAME:$BUILD_ID devhack95/$JOB_NAME:latest'
                }
            }
        }
    }
}