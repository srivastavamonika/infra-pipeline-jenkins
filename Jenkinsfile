pipeline {
  agent any

  environment {
    TF_VERSION = '1.6.0'
    TF_DIR = "${WORKSPACE}"
  }

  stages {
    stage('Checkout') {
      steps {
         git branch: 'main', url: 'https://github.com/srivastavamonika/infra-pipeline-jenkins.git'
      }
    }

   stage('Terraform Init') {
     steps {
       bat 'rm -rf .terraform .terraform.lock.hcl || true'
       bat 'terraform init'
       }
    }

    stage('Terraform Providers') {
      steps {
        bat 'terraform providers'
        }
    }

     stage('Show Files') {
       steps {
         bat 'find . -name "*.tf" -exec cat {} \\;'
         }
     }

    stage('Plan Infra') {
      steps {
        bat 'terraform plan -out=tfplan'
      }
    }

    stage('Apply Infra') {
      steps {
        input message: 'Approve to apply changes?'
        bat 'terraform apply tfplan'
      }
    }
  }

  post {
    always {
      echo 'Pipeline finished'
    }
  }
}
