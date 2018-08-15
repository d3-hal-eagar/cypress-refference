/* global cy, then, when, given */

When(/^without entering "(.*?)"$/, (fieldName) => {
});

Then(/^I shall be displayed an error - "(.*?)"$/, (errorText) => {
    cy.contains(errorText).should('be.visible');
});

Then(/^I shall be displayed an error for the "(.*?)" field - "(.*?)"$/, (formField,errorText) => {
    cy.getFormGroup(formField).contains(errorText).should('be.visible');
});

Then(/^I shall be displayed an error for the "(.*?)" field - "(.*?)" in red font color$/, (formField,errorText) => {
    cy.getFormGroup(formField).contains(errorText).should('be.visible');
    cy.getFormGroup(formField).find('span.text-danger').should('have.css', 'color', 'rgb(220, 53, 69)');
});

When(/^I focus on the "(.*?)" field$/, (formField) => {
    cy.getElement(formField).focus();
});

When(/^I click on the "(.*?)" field$/, (formField) => {
    cy.getElement(formField).click();
});

When(/^I click on the "(.*?)" element$/, (formField) => {
    cy.getFormGroup(formField).click('center', { force: true });
});

Then(/^Check that the "(.*?)" field is focused$/, (formField) => {
    cy.focused().should('have.attr', 'data-test', formField);
    // the test browser does not show the focused highlight correctly though this is known to work,
    // but that appears to be because the browser itself does not have focus.
});

Then(/^Check that the "(.*?)" field is not checked/, function (formField) {
    //cy.getElement(formField).should('have.class', 'ng-invalid');
    //cy.get('[data-test='+formField+']:checked').should('not.be.visible');
    cy.getElement(formField).should('not.be.checked');
});

Then(/^Check that the "(.*?)" field is checked/, function (formField) {
    //cy.get('[data-test='+formField+']:checked').should('be.visible');
    cy.getElement(formField).should('be.checked');
});

When(/^I have enter valid "(.*?)" value "(.*?)"$/, (formField,userInput) => {
    cy.getElement(formField).clear().type(userInput);
});

When(/^I have enter valid "(.*?)" value "(.*?)" that "(.*?)"$/, (formField,userInput, typeOfValidation) => {
    cy.getElement(formField).clear().type(userInput);
});

When(/^I enter additional text into "(.*?)" field text "(.*?)"$/, (formField,userInput) => {
    // no clear on this one, that's intentional
    cy.getElement(formField).type(userInput);
});

// noinspection JSUnusedLocalSymbols
When(/^I have enter invalid "(.*?)" value "(.*?)" that "(.*?)"$/, (formField,userInput, typeOfValidationFailure) => {
    cy.getElement(formField).clear().type(userInput);
});

When(/^I select "(.*?)" on the "(.*?)" field$/, (userInput, formField) => {
    cy.getElement(formField).focus().select(userInput);
});

Then(/^I shall be displayed no errors$/, () => {
    cy.get('.text-danger').should('not.be.visible');
});

Then(/^I shall be displayed no error for the "(.*?)" field$/, (formField) => {
    cy.getFormGroup(formField).find('.text-danger').should('not.be.visible');
});

// noinspection JSUnusedLocalSymbols
Given(/^Action detail "(.*?)"/, (descriptionText) => {

});

When(/^I am restricted from entering more than "(.*?)" characters in "(.*?)" field$/, (lengthLimit,formField) => {
    cy.getElement(formField).invoke('val').then((text) => {
        expect(text.length).to.eq(parseInt(lengthLimit));
    })
});

// Then(/^The X Icon is displayed inside the "(.*?)" input field$/, function (formField) {
//     cy.getFormGroup(formField).find('i.oi.oi-circle-x').should('be.visible');
// });


Then(/^I focus and click on X icon inside the "(.*?)" input field$/, function (formField) {
    cy.getFormGroup(formField).find('i.oi.oi-circle-x').click();
});

When(/^I have enter invalid "(.*?)" value I see the correct validation error message$/, function (formField,dataTable) {
    // starting at rowindex 1 to skip header row
    for (let rowindex = 1, rows = dataTable.rawTable.length; rowindex < rows; rowindex++) {
        let userInput = dataTable.rawTable[rowindex][0];
        let errorType = dataTable.rawTable[rowindex][1];
        let errorText = dataTable.rawTable[rowindex][2];
        // log test intent this is otherwise lost when doing multiple tests in a single step
        cy.log('(example #'+rowindex+') I have enter invalid '+formField+' value "'+userInput+'" that '+errorType+' and am displayed an error "'+errorText+'"');
        // chained actions clear previous error
        // re-enter text and check for error
        cy.getElement(formField).clear().type('valid text').blur()
          .getFormGroup(formField).find('.text-danger').should('not.be.visible').wait(300)
          .getElement(formField).clear().type(userInput).blur()
          .getFormGroup(formField).contains(errorText).should('be.visible').wait(300);
    }

});
