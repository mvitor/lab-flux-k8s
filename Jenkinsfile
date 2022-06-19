  pipeline {
    agent {
      node {
        label "linux"
      } 
    }

    stages {
      stage('fetch_latest_code') {
        steps {
          git  branch: 'main', credentialsId: '53a9debb-e825-436b-a74f-e4ba065f3c78', url: 'https://github.com/mvitor/lab-flux-k8s.git'
        }
      }

      stage('TF Init&Plan') {
        steps {
            sh "pwd"
            dir('infrastructure/terraform/scripts/fargate_profile') {
              sh "pwd"
            
              sh '/usr/local/bin/terraform init'
              sh '/usr/local/bin/terraform plan'
            }
        }      
      }

      stage('TF Apply') {
        steps {
          dir('infrastructure/terraform/scripts/fargate_profile') {

            sh '/usr/local/bin/terraform apply --auto-approve'
          }
        }
      }
    } 
  }