docker run --rm -v ${PWD}/../env:/etc/env \
    -v ${PWD}/../report:/etc/report \
    -t postman/newman run \
    https://www.getpostman.com/collections/2aa7f23ee76441fcd16c \
    --environment="/etc/env/docker.postman_environment.json" \
    --reporters junit --reporter-junit-export="/etc/report/Smoke-report.xml"