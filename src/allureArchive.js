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

function deleteFiles(startPath,filter){

    let filesArray = [];
    //console.log('Starting from dir '+startPath+'/');

    if (!fs.existsSync(startPath)){
        console.log("no dir ",startPath);
        return;
    }

    const files=fs.readdirSync(startPath);
    for(let i=0;i<files.length;i++){
        let filename=path.join(startPath,files[i]);
        let stat = fs.lstatSync(filename);
        if (stat.isDirectory()){
            //deleteFiles(filename,filter); //recurse
        }
        else if (filename.indexOf(filter)>=0) {
            filesArray.push(filename);
            fs.unlink(filename, (err) => {
                if (err) throw err;
            });
        }
    }
    return filesArray;
}
if (fs.existsSync('allure-report/history')) {
    fse.copy('allure-report/history','allure-results/history', (err) => {
        if (err) throw err;
    });
}
if (fs.existsSync('cypress/screenshots')) {
    console.log( 'there are screenshots' );
    // fse.copy('cypress/screenshots','allure-report/data/attachments/screenshots', (err) => {
    //     if (err) throw err;
    // });
    //todo add screenshots to results files
}
if (fs.existsSync('cypress/videos')) {
    console.log( 'there are videos' );
    // fse.copy('cypress/videos','allure-report/data/attachments/videos', (err) => {
    //     if (err) throw err;
    // });
    //todo add video to results files
}


const { exec  } = require( 'child_process' );
const proc1 = exec('allure generate --clean');

    proc1.stdout.on( 'data', data => {
        console.log( `stdout: ${data}` );
    } );
    proc1.stderr.on( 'data', data => {
        console.log( `stderr: ${data}` );
    } );
    proc1.on( 'error', code => {
        console.log( `bleh ${code}` );
    } );
    proc1.on( 'close', code => {
        console.log( `child process 1 exited with code ${code}` );
        if (fs.existsSync('cypress/screenshots')) {
            console.log( 'there are screenshots' );
            fse.copy('cypress/screenshots','allure-report/data/attachments/screenshots', (err) => {
                if (err) throw err;
            });
            //todo add screenshots to results files
        }
        if (fs.existsSync('cypress/videos')) {
            console.log( 'there are videos' );
            fse.copy('cypress/videos','allure-report/data/attachments/videos', (err) => {
                if (err) throw err;
            });
            //todo add video to results files
        }
        console.log( 'adding report to archive' );
        let cibuildid = 'local-docker'+yyyy+mm+dd+time;
        fse.copy('allure-report','reports-archive/allure-report'+cibuildid, (err) => {
            if (err) throw err;
        });
        //deleteFiles('allure-results','-testsuite.xml');
        //todo upload test results
    } );

