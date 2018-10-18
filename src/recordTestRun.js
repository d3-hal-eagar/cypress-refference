let today = new Date();
let dd = today.getDate();
let mm = today.getMonth()+1; //January is 0!

let yyyy = today.getFullYear();
if(dd<10){
    dd='0'+dd;
}
if(mm<10){
    mm='0'+mm;
}
let cibuildid = 'local-docker'+yyyy+mm+dd;
let commandDesktop = "node_modules/.bin/cypress run --spec 'cypress/integration/ci/components/**/*' --record --key f3230691-58fd-4a68-9a0d-9ceb252be8e6 --group desktop --parallel --ci-build-id " + cibuildid;
let commandMobile  = "node_modules/.bin/cypress run --spec 'cypress/integration/ci/components/**/*' --config viewportWidth=360,viewportHeight=640 --env TESTMODE=mobile --record --key f3230691-58fd-4a68-9a0d-9ceb252be8e6 --group mobile --parallel --ci-build-id " + cibuildid;

//node_modules/.bin/cypress run --spec 'cypress/integration/ci/end2end/**/*'

const { exec  } = require( 'child_process' );
const proc1 = exec('node '+commandDesktop);
const proc2 = exec('node '+commandMobile);


    proc1.stdout.on( 'data', data => {
            console.log( `stdout: ${data}` );
        } );
    proc1.stderr.on( 'data', data => {
            console.log( `stderr: ${data}` );
        } );
    proc1.on( 'close', code => {
        console.log( `child process 1 exited with code ${code}` );
    } );
    proc1.on( 'error', code => {
        console.log( `bleh ${code}` );
    } );
    proc2.stdout.on( 'data', data => {
        console.log( `stdout: ${data}` );
    } );
    proc2.stderr.on( 'data', data => {
        console.log( `stderr: ${data}` );
    } );
    proc2.on( 'close', code => {
        console.log( `child process 2 exited with code ${code}` );
    } );
    proc2.on( 'error', code => {
        console.log( `bleh ${code}` );
    } );

