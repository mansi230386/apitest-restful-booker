# Define report export path
REPORT_PATH="../reports/regression"

# Make a directory in which to store HTML reports, creating parent dirs as needed
mkdir -p $REPORT_PATH

# Using newman...
# Run ResponseContent collection:     run ../collections/regression.postman_collection.json
#  in Local env:            -e ../env/local.postman_environment.json
#  load booking data file:  -d ../data/booking.json
#  output via newman-reporter-htmlextra:    -r htmlextra
#  export report to dir created above:      --reporter-htmlextra-export $REPORT_PATH
#  with 'Regression Test' title on HTML report page:     --reporter-htmlextra-title "Regression Test"
newman run ../collection/regression.postman_collection.json -e ../env/local.postman_environment.json -d ../data/booking.json -r htmlextra --reporter-htmlextra-export $REPORT_PATH --reporter-htmlextra-title "Regression Test"

