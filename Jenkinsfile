pipeline {
	agent any
	
	environment {
		JAR_NAME = "spring-docker-demo.jar"
		IMAGE_NAME = "spring-docker-demo"
		CONTAINER_NAME = "spring-docker-demo-container"
	}
	
	stages {
		stage('Checkout'){
			steps{
				git branch:'master',url:'https://github.com/Dipesh-Chadgal/git-rest-simple.git'
			}
		}
		
		stage('Build') {
			steps {
				bat 'mvn clean package'
			}
		}
		
		stage('Build Docket Image'){
			steps {
				bat """
				docker build -t %IMAGE_NAME% .
				
			"""
			}
		}
		
		stage('Deploy'){
			steps {
				bat """
				docker stop %CONTAINER_NAME% || exit 0
				docker rm %CONTAINER_NAME% || exit 0
				"""
				
				bat """
					docker run -d -p 9050:8080 --name %CONTAINER_NAME% %IMAGE_NAME%
				"""
			}
		}
	}
	
	post {
	sucess {
		echo "Build and deploymeny sucessful !"
	}
	failure {
		echo "build or deployment failed !"
	}
	
  }
}

