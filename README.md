# cypress-cucumber-example
Initial example of using Cypress with Cucumber.

install
    
    npm -i

    
run tests interactive (for debug or authoring)

    ./node_modules/.bin/cypress open
    
 run tests headless (for ci, note generates video files of runs)
    
    ./node_modules/.bin/cypress run 
    
 run tests headless and report to cypress dashboard
    
    ./node_modules/.bin/cypress run --record --key f3230691-58fd-4a68-9a0d-9ceb252be8e6
        

run on docker

	...
	

Run tests specifying a glob of where to look for test files

    cypress run --spec 'cypress/integration/exampletests/**/*' 

- though cypress docs indicate you can input a specific spec file 
or list of spec files this does not work with the cucumber .features files
only sub-folder globing works

Reports
-
- unit files found in /src/cypress/reports
- Videos of test runs found in /src/cypress/videos
- Screenshots of tests found in /src/cypress/schreenshots
    