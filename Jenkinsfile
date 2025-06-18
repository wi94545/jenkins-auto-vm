pipeline {
    agent any

    environment {
        GOOGLE_CREDENTIALS = credentials('gcp-service-account-json')
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'git@github.com:wi94545/jenkins-auto-vm.git'
            }
        }

        stage('Terraform Init') {
            steps {
                dir('terraform') {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                dir('terraform') {
                    script {
                        def planStatus = sh(script: 'terraform plan', returnStatus: true)
                        if (planStatus != 0) {
                            error("Terraform plan failed, aborting pipeline.")
                        }
                    }
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                dir('terraform') {
                    sh 'terraform apply -auto-approve'
                }
            }
        }
    }
}

