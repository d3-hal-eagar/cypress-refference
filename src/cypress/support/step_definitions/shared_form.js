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
    cy.getElement(formField).click();
});

When(/^I click on the "(.*?)" field$/, (formField) => {
    cy.getElement(formField).click();
});

Then(/^Check that the "(.*?)" field is focused$/, (formField) => {
    cy.focused().should('have.attr', 'data-test', formField);
    // the test browser does not show the focused highlight correctly though this is known to work,
    // but that appears to be because the browser itself does not have focus.
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


Then(/^I shall be displayed no errors$/, () => {
    cy.get('.text-danger').should('not.be.visible');
});

Then(/^I shall be displayed no error for the "(.*?)" field$/, (formField) => {
    cy.getFormGroup(formField).find('.text-danger').should('not.be.visible');
});

// noinspection JSUnusedLocalSymbols
Given(/^Action detail "(.*?)"/, (descriptionText) => {

});
