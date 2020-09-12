docker run --rm -v ${PWD}/../env:/etc/env \
    -v ${PWD}/../data:/etc/data \
    -v ${PWD}/../report:/etc/report \
    -t postman/newman run \
    https://www.getpostman.com/collections/30c508a79efba85836a8 \
    --environment="/etc/env/docker.postman_environment.json" \
    -d /etc/data/booking.json \
    --reporters junit --reporter-junit-export="/etc/report/Regression-report.xml"