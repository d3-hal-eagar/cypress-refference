/* global cy, then, when, given */

When(/^without entering "(.*?)"$/, (fieldName) => {

});

Then(/^I shall be displayed an error - "(.*?)"$/, (errorText) => {
    cy.contains(errorText).should('be.visible');
});

Then(/^I shall be displayed an error for the "(.*?)" field - "(.*?)"$/, (formField,errorText) => {
    cy.getFormGroup(formField).contains(errorText).should('be.visible');
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
