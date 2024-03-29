pipeline {
    agent any
    
    environment {
        myuser = credentials ('dockerhub-user')
        mypassword = credentials ('dockerhub-password')

        POSTGRES_HOST = credentials ('POSTGRES_HOST')
        POSTGRES_PASSWORD = credentials ('POSTGRES_PASSWORD')
        AWS_ACCESS_KEY_ID = credentials ('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials ('AWS_SECRET_ACCESS_KEY')
        version = "v3"
        keyfile = credentials ('keyfile')

    }
    
    stages {
       stage ("download code") {
         steps {
            sh '''
            git clone https://github.com/mzmarci/hrapp2.git
           
            '''
         }
       }
    
       stage ("build image") {
         steps {
            sh '''
                  cd hrapp2
                  docker build -t mzmarci/hrapp:$version .
               '''   
         }
       }
    
       stage ("publish image") {
         steps {
            sh '''
                  docker login -u $myuser -p $mypassword
                  docker push mzmarci/hrapp:$version
                '''
         }
       }       
    
       stage ("Build image") {
         steps {
            sh '''
               ls
                # docker run --name hrapp  --rm -d -p 5000:5000 mzmarci/hrapp:$version
               '''
         }
       }


       stage ("Run ansible") {
         steps {
            sh '''
                 cd hrapp2
                 cd Ansible
                 pwd 
                 ls
                 ANSIBLE_HOST_KEY_CHECKING=false ansible-playbook -i inventory --key-file $keyfile playbook.yml -u ec2-usec
                 ANSIBLE_HOST_KEY_CHECKING=false ansible-playbook -i inventory  --key-file $keyfile playbookA.yml -u ec2-user 
               '''
         }
       }      
       stage ("run docker-compose") {
         steps {
            sh '''
                  cd hrapp2
                  cd docker-compose
                  docker-compose up
                
                '''
         }
       }
           
    

      

    }

    post {
        always {
            deleteDir()
        }
    }
}