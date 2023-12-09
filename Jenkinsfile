pipeline {
    agent { 
        node {
            label 'docker-agent-alpine-jdk11-python'
            }
      }
    stages {
        stage('Build') {
            steps {
                echo 'install requirements:'
                sh 'cd pythonapp'                
                sh 'pip3 install -r requirements.txt'
            }
        }
        stage('Test') {
            steps {
                echo "Testing fire app:"
                sh 'cd pythonapp'
                sh 'python3 hello_world_fire.py'
                sh 'python3 hello_world_fire.py --name=Testman'
            }
        }
    }
}