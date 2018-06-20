# cypress-cucumber-example
Initial example of using Cypress with Cucumber.

install
    
    npm install

run tests interactive (for debug or authoring)

    ./node_modules/.bin/cypress open
    aka> npm run test
    
    node_modules/.bin/cypress open --config 'integrationFolder=cypress/integration/inprogress'
    aka> npm run cypress:inprogress
    
 run tests headless (for ci, note generates video files of runs)
    
    ./node_modules/.bin/cypress run 
    
 run tests headless and report to cypress dashboard
    
    ./node_modules/.bin/cypress run --record --key f3230691-58fd-4a68-9a0d-9ceb252be8e6
- not planning to use cypress dashboard for CI runs CI reporting should be enough/good
- usfull however if a dev wants persistent or sharable reports       


Run tests specifying a glob of where to look for test files

    - for CI pipeline testing
    cypress run --spec 'cypress/integration/exampletests/**/*' 
    cypress run --spec 'cypress/integration/exampletests/passing/**/*' 
    cypress run --spec 'cypress/integration/exampletests/failing/**/*' 
    - don't run these on CI they are not complete
    cypress run --spec 'cypress/integration/pending/**/*' 
    cypress run --spec 'cypress/integration/inprogress/**/*' 
    - real world final tests for CI 
    cypress run --spec 'cypress/integration/ci/**/*' 
    cypress run --spec 'cypress/integration/ci/component/**/*' 
    cypress run --spec 'cypress/integration/ci/end2end/**/*' 
    
> though cypress docs indicate you can input a specific spec file 
or list of spec files this does not work with the cucumber .features files
only sub-folder globing works

Reports
-
- mocha junit report files found in /src/cypress/reports
    - junit xml format
    - xml file per cucumber Feature
    - multiple tests (scenario) per file
    - file name pre-pended with hash (mocha's way of handling parallel tests)
- Videos of test runs found in /src/cypress/videos
    - mp4 format
    - only generated with headless run
    - one per feature
    - follow the filename and folder structure of the feature files indies 'integration'
- Screenshots of tests found in /src/cypress/screenshots
    - auto generated on fail
        - file name from the feature and scenario title (text in the file not filename)
    - Screenshots generated by step code defaults to above name but can be set in step code
    
> these paths are configurable as needed https://docs.cypress.io/guides/references/configuration.html#Folders-Files

> if *trashAssetsBeforeRuns* in src/cypress.json is set *true* the video and screenshot folder and all .xml files in reports folder are deleted before test run
    
Configuration
-
set in src/cypress.json

can be overridden in command line 

    cypress run --config integrationFolder=mobile,viewportWidth=320,viewportHeight=600
    
can be overridden by enviroment variables

    export CYPRESS_VIEWPORT_WIDTH=800
    export CYPRESS_VIEWPORT_HEIGHT=600
    export CYPRESS_viewportHeight=600
    export CYPRESS_baseURL=https://ci.host