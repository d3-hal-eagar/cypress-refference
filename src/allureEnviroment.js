/* jshint node: true */

(function() {
    "use strict";

let today = new Date();
let dd = today.getDate();
let mm = today.getMonth()+1; //January is 0!
let time = '-'+today.getHours() +'-'+ today.getMinutes() +'-'+ today.getSeconds();

let yyyy = today.getFullYear();
if(dd<10){
    dd='0'+dd;
}
if(mm<10){
    mm='0'+mm;
}

const path = require('path'), fs=require('fs-extra'), fse=require('fs-extra');
const parseString = require('xml2js').parseString, xml2js = require('xml2js');
const klawSync = require('klaw-sync');
const sanitize = require("sanitize-filename");
const _ = require("lodash");
const maxFileNameLength = 220;
const RUNNABLE_SEPARATOR = " -- ";
const pathSeparatorRe = /[\\\/]/g;
const invalidCharsRe = /[^0-9a-zA-Z-_\s\(\)]/g;


const os = require('os');

    function setAllureEnvironment() {
        const filename = 'allure-results/environmentTemplate.xml';
        const enviromentFile = 'allure-results/environment.xml';
        fs.readFile(filename, 'utf-8', function (err, xml) {
            if (err) { throw err; }
            parseString(xml, function (err, json) {
                if (err) { throw err; }
                if (json === null) {
                    console.log('xml json is null for ' + filename);
                    return;
                }
                let paramaters = json['environment']['parameter'];

                paramaters.push({
                    key:'PLATFORM',
                    value:os.platform() +' '+ os.type()
                });
                paramaters.push({
                    key:'HOSTNAME',
                    value:os.hostname()
                });
                paramaters.push({
                    key:'baseUrl',
                    value:process.env.CYPRESS_baseUrl
                });
                paramaters.push({
                    key:'TESTMODE',
                    value:process.env.TESTMODE
                });

                // json back to xml.
                var builder = new xml2js.Builder();
                var xml = builder.buildObject(json);

                fs.writeFile(enviromentFile, xml, function (err, data) {
                    if (err) { throw err; }
                });
            });
        });
    }

    try {
        setAllureEnvironment();
    }
    catch(e) { console.log(e); }

})();
