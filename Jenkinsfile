pipeline {
    agent { 
        node {
            label 'docker-agent-alpine-jdk11-python'
            }
      }
    stages {
        stage('Build') {
            steps {
                echo "Building.."
                sh '''
                echo "doing build stuff.."
                '''
            }
        }
        stage('Test') {
            steps {
                echo "Testing.."
                sh '''
                cd pythonapp
                python3 hello_world_fire.py
                python3 hello_world_fire.py --name=Testman
                '''
            }
        }
        stage('Deliver') {
            steps {
                echo 'Deliver....'
                sh '''
                echo "doing delivery stuff.."
                '''
            }
        }
    }
}