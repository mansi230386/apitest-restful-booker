//Docker run Jenkins-images using below command

docker run -u root --rm -d \
-p 8080:8080 \
-p 50000:50000 \
-v jenkins-data:/var/jenkins_home \
-v jenkins-root:/root \
-v /var/run/docker.sock:/var/run/docker.sock \
jenkinsci/blueocean

Jenkins should start on  http://localhost:8080/
