 const path = require('path'), fs=require('fs');

 const reportXml = 'cypress/reports/jreport.xml';


const jv = require('junit-viewer')
//const parsedData = jv.parse(reportXml);
//const parsedData = jv.parseXML('<xml>');
//const renderedData = jv.render(parsedData);
const parsedAndRenderedData = jv.junit_viewer('cypress/reports/');

fs.writeFile('cypress/reports/CypressTestReport.html', parsedAndRenderedData, function(err) {
    if(err) {
        return console.log(err);
    }

    console.log("The CypressTestReport file was saved!");
});
