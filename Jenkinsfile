pipeline {
    agent { 
        dockerfile true
    }
    stages {
        stage('Build') {
            steps {
                echo 'install requirements:'
                sh '''
                cd pythonapp               
                pip3 install -r requirements.txt
                '''
            }
        }
        stage('Test') {
            steps {
                echo "Testing fire app:"
                sh '''
                cd pythonapp
                python3 hello_world_fire.py
                python3 hello_world_fire.py --name=Testman
                '''
            }
        }
    }
}