pipeline {
    agent any
    
    environment {
        APP_NAME = 'admin-ops'
        VERSION = '1.0.0'
    }
    
    stages {
        stage('Checkout') {
            steps {
                echo 'Checking out source code...'
                checkout scm
            }
        }
        
        stage('Build') {
            steps {
                echo 'Building application...'
                echo "Building ${APP_NAME} version ${VERSION}"
                sh 'echo "Build step executed successfully"'
            }
        }
        
        stage('Test') {
            steps {
                echo 'Running tests...'
                sh 'echo "Running unit tests..."'
                sh 'echo "Running integration tests..."'
                sh 'echo "All tests passed!"'
            }
        }
        
        stage('Code Quality') {
            steps {
                echo 'Performing code quality checks...'
                sh 'echo "Linting code..."'
                sh 'echo "Code quality checks completed"'
            }
        }
        
        stage('Deploy') {
            when {
                branch 'main'
            }
            steps {
                echo 'Deploying to environment...'
                sh 'echo "Deployment completed successfully"'
            }
        }
    }
    
    post {
        always {
            echo 'Pipeline execution completed'
            echo "Build URL: ${env.BUILD_URL}"
        }
        success {
            echo '✅ Pipeline succeeded!'
        }
        failure {
            echo '❌ Pipeline failed!'
        }
    }
}