// var {defineSupportCode} = require('cucumber');
//
// defineSupportCode(function ({And, But, Given, Then, When}) {
//     When(/^I select the back button located at the top left corner of the browser$/, function (callback) {
//         callback.pending();
//     });
// });

When(`I select the back button located at the top left corner of the browser`, () => {
    cy.go('back');
});
