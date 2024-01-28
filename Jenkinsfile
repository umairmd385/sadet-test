pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }
    stages {
        stage("Git Checkout") {
            steps {
                git branch: 'main', url: 'https://github.com/umairmd385/sadet-test.git'
            }
        }
        stage("Unit Testing") {
            steps {
                script {
                    sh 'composer update --ignore-platform-reqs --no-scripts'
                    sh 'composer dump-autoload'
                    sh 'composer require --dev phpunit/phpunit'
                    sh 'php artisan cache:clear'
                    sh 'php artisan config:cache'
                    sh 'php artisan key:generate' 
                    sh 'php artisan config:cache'
                    sh 'phpunit'
                }
            }
        }
        stage("TRIVY File Scan") {
            steps {
                sh "trivy fs ."
            }
        }
        stage("Docker Build & Push") {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: "docker",passwordVariable:"dockerPass",usernameVariable:"dockerUser")]) {
                        sh "docker login -u ${env.dockerUser} -p ${env.dockerPass}"
                        sh "docker build -t ${env.dockerUser}/sadet ."
                        sh "docker push ${env.dockerUser}/sadet:latest"
                    }
                }
            }
        }
        stage("TRIVY Image Scan") {
            steps {
                sh "trivy image technicaltalk/sadet:latest" 
            }
        }
        stage("Terraform Init") {
            steps {
                script {
                    dir('terraform') {
                        sh "terraform init"
                    }
                }
            }
        }
        stage("Terraform Format") {
            steps {
                script {
                    dir('terraform') {
                        sh "terraform fmt"
                    }
                }
            }
        }
        stage("Deployment to Cloud") {
            steps {
                script {
                    dir('terraform') {
                        sh "terraform apply -auto-approve"
                    }
                }
            }
        }
    }
}