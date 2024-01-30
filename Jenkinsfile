pipeline {
    agent { label 'tf' }
    environment {
        AWS_ACCESS_KEY_ID     = credentials('jenkins-aws-secret-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('jenkins-aws-secret-access-key')
    }
    options {
        // Keep the 10 most recent builds
        buildDiscarder(logRotator(numToKeepStr:'10'))
    }
    stages {
        stage('scm') {
            steps {
                git branch: 'main',
                url: 'https://github.com/ch-e-mistry/tf-code-cicd-demo.git'
            }
        }
        stage('init') {
            steps {
                sh 'terraform init'
            }
        }
        stage('plan') {
            steps {
                // pan
                sh 'terraform plan -out=my_plan'

                // Archive the built artifacts
                archive includes: 'my_plan'
            }
        }
    }
}
