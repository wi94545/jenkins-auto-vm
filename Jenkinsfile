pipeline {
    agent any

    parameters {
        choice(name: 'ACTION', choices: ['apply', 'destroy'], description: 'Choose Terraform action')
    }

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

        stage('Terraform Plan or Destroy Plan') {
            steps {
                dir('terraform') {
                    script {
                        if (params.ACTION == 'apply') {
                            def planStatus = sh(script: 'terraform plan', returnStatus: true)
                            if (planStatus != 0) {
                                error("Terraform plan failed, aborting pipeline.")
                            }
                        } else if (params.ACTION == 'destroy') {
                            def planStatus = sh(script: 'terraform plan -destroy', returnStatus: true)
                            if (planStatus != 0) {
                                error("Terraform destroy plan failed, aborting pipeline.")
                            }
                        }
                    }
                }
            }
        }

        stage('Terraform Apply or Destroy') {
            steps {
                dir('terraform') {
                    script {
                        if (params.ACTION == 'apply') {
                            sh 'terraform apply -auto-approve'
                        } else if (params.ACTION == 'destroy') {
                            sh 'terraform destroy -auto-approve'
                        }
                    }
                }
            }
        }
    }
}
