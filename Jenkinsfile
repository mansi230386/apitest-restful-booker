pipeline {
  agent {
    docker {
      image 'mansi2303/newman-with-htmlextra'
      args '-t'
    }
  }
  stages {
    stage('Test') {
      steps {
        sh 'newman run collection/restful_booker_Copy.postman_collection.json --environment env/Test.postman_environment.json --reporters htmlextra,junit --reporter-htmlextra-export report/html/smoke.html --reporter-htmlextra-title "Smoke Test" --reporter-junit-export report/junit/smoke-report.xml'
      }
    }
  }
  post {
    success {
      junit 'report/junit/*.xml'
      publishHTML([allowMissing: true, alwaysLinkToLastBuild: false, keepAll: true, reportDir: 'report/html', reportFiles: 'smoke.html', reportName: 'API Test Report', reportTitles: ''])
    }
  }
}
