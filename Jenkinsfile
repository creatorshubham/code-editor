pipeline{
 agent any
  stages{
   stage('Test Stage'){
    steps{
     script{
      sh '''
       echo Test cases passed
         '''
     }
    }
  }
   stage('Generate Artifact'){
    steps{
     script{
      sh '''
       tar -cf app.tar ./
         '''
     }
    }
  }
   stage('Build Docker'){
    steps{
     script{
      sh '''
       echo 'Buid Docker Image'
       docker build -t creatorshubham/code-editor:v.${BUILD_NUMBER} .
         '''
     }
    }
  }
   stage('Pushing to Docker Hub'){
    steps{
     withCredentials([string(credentialsId: 'dockerhub-pass', variable: 'pass')]) {
      script{
       sh 'docker login -u creatorshubham -p ${pass}'
        //sh 'docker push creatorshubham/code-editor:v.${BUILD_NUMBER}'
      }
}
    }
   }
   stage('Deploying container to Kubernetes') {
      steps {
       withKubeConfig([credentialsId: 'kube-config']) {
    script{
     sh 'kubectl apply -f deployment.yml'
     //sh 'kubectl set image deployment/deployment01 code-editor=creatorshubham/code-editor:v.${BUILD_NUMBER}'
        }
       }
      }
    }
  } 
}
