pipeline {
    agent any

    stages {
        stage('Code') {
            steps {
                git url:"https://github.com/Varshipk/node-todo-cicd.git",branch:"main"
            }
        }
        stage("Build and Test"){
            steps{
                sh 'docker build -t varshipk/node-todo-cicd:latest .'
            }
        }
        stage("Push"){
            steps{
               withCredentials([usernamePassword(
                   credentialsId:'dockerHub',passwordVariable:'dockerHubPassword',usernameVariable:'dockerHubUsername'
                   )]){
                 sh "docker login -u ${env.dockerHubUsername} -p ${env.dockerHubPassword}"
                   sh 'docker push varshipk/node-todo-cicd:latest' 
                   }

            }
        }
        stage("Deploy"){
           steps{
                sh 'docker-compose down && docker-compose up -d'
           }
        }
        }
    }