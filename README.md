# cypress-cucumber-example
Initial example of using Cypress with Cucumber.

install
    
    npm -i

    
run tests interactive

    ./node_modules/.bin/cypress open
    node_modules/.bin/cypress open
    
 run tests headless
    
    node_modules/.bin/cypress run 
    
 run tests headless and report to dashboard
    
    node_modules/.bin/cypress run --record --key f3230691-58fd-4a68-9a0d-9ceb252be8e6
    
    
 run tests headless send screenshots and video to dashboard
    
    node_modules/.bin/cypress ci --record --key f3230691-58fd-4a68-9a0d-9ceb252be8e6
    

run on docker

	...
	
	
Reports, found in /src/cypress/reports
Videos of test runs found in /src/cypress/videos
Screenshots of tests found in /src/cypress/schreenshots