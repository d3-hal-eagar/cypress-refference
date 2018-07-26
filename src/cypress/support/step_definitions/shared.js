/* global cy, then, when, given */

Then(/^I see "(.*?)" in the title$/, (title) => {
    cy.title().should('include', title);
});

Then(/^take screenshot named "(.*?)"$/, (filename) => {
    cy.screenshot(filename);
});

Then("take screenshot", () =>{
    cy.screenshot();
});

When(/^I am on the "(.*?)" page$/, (pageName) => {
    // no host info, so it will use baseURL as set in cypress.json or env variable CYPRESS_baseURL
    cy.visit(pageName);
});

When(/^I select "(.*?)"$/, (buttonText) => {
    cy.contains(buttonText).click();
});

When(/^without entering "(.*?)"$/, (fieldName) => {

});

When(/^I click "(.*?)"$/, (linkText) => {
    cy.contains(linkText).click();
});

When(/^I click button "(.*?)"$/, (linkText) => {
    cy.get('button').contains(linkText).click();
});

When(/^I click link "(.*?)"$/, (linkText) => {
    cy.get('a').contains(linkText).click();
});

Then(/^I shall be displayed an error - "(.*?)"$/, (errorText) => {
    cy.contains(errorText).should('be.visible');
});

Then(/^I shall be displayed an error for the "(.*?)" field - "(.*?)"$/, (formField,errorText) => {
    cy.getFormGroup(formField).contains(errorText).should('be.visible');
});

Then(/^The page header is "(.*?)"$/, (headerText) => {
    cy.get('h1').contains(headerText).should('be.visible');
});

When(/^I focus on the "(.*?)" field$/, (formField) => {
    cy.getElement(formField).click();
});

Then(/^The "(.*?)" field is focused$/, (formField) => {
    cy.focused().should('have.attr', 'data-test', formField);
    // the test browser does not show the focused highlight correctly though this is known to work,
    // but that appears to be because the browser itself does not have focus.
});

When(/^I have enter valid "(.*?)" value "(.*?)"$/, (formField,userInput) => {
    cy.getElement(formField).type(userInput);
});

// noinspection JSUnusedLocalSymbols
When(/^I have enter invalid "(.*?)" value "(.*?)" that "(.*?)"$/, (formField,userInput, typeOfValidationFailure) => {
    cy.getElement(formField).type(userInput);
});
