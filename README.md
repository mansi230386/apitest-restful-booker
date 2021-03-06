# Postman API testing with restful-booker
## Background
I set up this repo as a place to store my work and document for myself what I've learned so far. If you're also new to API testing and find something in here that helps you get started, right on!

## Repo Structure
* Collections:
  * Requests in Postman can be grouped into collections. I've used collections to organize requests into test suites.
* Env:
  * Postman uses the concept of environments to manage variables between various server setups (local, dev, production, etc.). I've created two environment configurations: local and production.
* Scripts:
  * Postman collections can be executed via the command line using Newman. To save myself the work of entering the same command and options into my terminal, I've created shell scripts to do it for me, based on collection and environment.
## Dependencies
* Install [Postman](https://www.getpostman.com/)
* Install [Restful Booker API](https://github.com/mwinteringham/restful-booker)locally (optional)
  * This API is deployed publicly and testing against the live version is welcomed.
  * However, I recommend installing and running the API from your machine for a few reasons:
    * You'll get to see the activity logging
    * You won't have to worry about the API being inaccessible due to maintenance or network issues
    * You'll be guaranteed to be the only person touching your data
* Install [Newman](https://github.com/postmanlabs/newman)
* Install newman-reporter-htmlextra
## Setup
1. Install all dependencies listed above.
2. Download or clone this repo.
3. Launch Postman
    * Create a new personal workspace, if desired.
        * More info: [Intro to Workspaces](https://learning.postman.com/docs/collaborating-in-postman/using-workspaces/creating-workspaces/)
    * Import a collection (from file) into Postman.
        * More info: [Collection - Data Formats](https://learning.postman.com/docs/getting-started/importing-and-exporting-data/)
        * Collection files are stored in this repo under /collections (ex. collections/Smoke.postman_collection.json)
    * Import one or more environments (from file(s)) into Postman.
        * Environments are imported the same way that collections are.
        * Environment files are stored in this repo under /env (ex. env/Production.postman_environment.json)
        * Import the Production environment file if you'd like to run tests against the publicly-accessible instance of [Restful Booker](https://restful-booker.herokuapp.com/).
        * Import the Local environment file if you'd like to run tests against an instance of Restful Booker running locally on your machine.
4. Start your local instance of Restful Booker (optional).
More info: [Restful Booker](https://github.com/mwinteringham/restful-booker)
5. Select your desired environment in Postman.
More info: [Selecting an active environment](https://learning.postman.com/docs/sending-requests/managing-environments/)
Select "Production" if you want to test against the publicly-accessible instance, or select "Local" if you are running Restful Booker locally.
## Running Tests
When running tests, you can choose to run them in various ways:

### Run a test for a single request
1. On the Collections tab of the Postman sidebar, expand the imported Smoke collection and expand any of the included folders, such as "Auth".
2. Select a request, such as "CreateToken" under the Auth folder.
3. Within the CreateToken screen, you'll see smaller tabs for the request info (Params, Authorization, Headers, etc.)
   * Click on the Body tab to see what the request will send.
   * Click on the Tests tab to see what will be validated after the request is sent.
4. Click the big, blue "Send" button in the upper-right of the CreateToken screen.
5. All of the response info will then be updated in the lower portion of the screen.
6. Tap on the "Test Results" tab to see if the test(s) passed or failed.
### Run all tests for a folder or collection
1. From the Postman header bar, click "Runner".
2. From the collection browser, select either a collection, such as "Smoke", or drill down to a specific folder, such as "Booking".
3. Select your desired environment from the dropdown.
4. Click the big, blue "Run" button.
5. Review the list of Run Results to see which tests passed or failed.
* More info: [Starting a collection run](https://learning.getpostman.com/docs/postman/collection_runs/starting_a_collection_run/)
### Run a collection using Newman
1. In a Terminal, change directory to the top level of this repo.
2. Run the following command (alter the paths for the collection file and environment file, if needed):
```
newman run collection/smoke.postman_collection.json -e env/local.postman_environment.json -r htmlextra

```
   * More info: [Command line integration with Newman](https://learning.postman.com/docs/postman/collection_runs/command_line_integration_with_newman/)
3. This will create a newman folder in your repo directory.
   * Using Finder, navigate to the newman folder and open the html file that was just created to view the test report.
   * More info: [newman-reporter-htmlextra](https://github.com/DannyDainton/newman-reporter-htmlextra)
4. Note: I've created a shell script to run the Smoke collection against the local environment, and export a report to reports/smoke.
   * Script is located in: scripts/smoke_local.sh
   * Review the script to see the specific options that I've used.

## Run a collection with a newman container
To run using docker image use below command
```
docker run --rm -v ${PWD}:/etc/postman \
    -t postman/newman run \
    /etc/postman/restful_booker_Copy.postman_collection.json \
    --environment=/etc/postman/Test.postman_environment.json \
    --reporters junit --reporter-junit-export="/etc/postman/dockerReport/apireport.xml"
```    
To run in local use 
```
newman run collection/restful_booker_Copy.postman_collection.json --environment env/Test.postman_environment.json --reporters htmlextra,junit --reporter-htmlextra-export report/html/smoke.html --reporter-htmlextra-title "Smoke Test" --reporter-junit-export report/junit/smoke-report.xml

```
