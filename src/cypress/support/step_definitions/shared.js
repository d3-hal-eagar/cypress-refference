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

When(/^I am guided to "(.*?)"/, (pageName) => {
    cy.url.should('eq',pageName);
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

When(/^I click on the "(.*?)" field$/, (formField) => {
    cy.getElement(formField).click();
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

When(/^I have enter into "(.*?)" field text "(.*?)"$/, (formField,userInput) => {
    cy.getElement(formField).type(userInput);
});

// noinspection JSUnusedLocalSymbols
When(/^I have enter invalid "(.*?)" value "(.*?)" that "(.*?)"$/, (formField,userInput, typeOfValidationFailure) => {
    cy.getElement(formField).type(userInput);
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
    cy.getElement(formField).clear().type(userInput);
});

// noinspection JSUnusedLocalSymbols
When(/^I have enter invalid "(.*?)" value "(.*?)" that "(.*?)"$/, (formField,userInput, typeOfValidationFailure) => {
    cy.getElement(formField).type(userInput);
});

let proprietaryNames = [];
Given(`the following list of proprietaryNames`, function (dataTable) {
    proprietaryNames = dataTable.rawTable;
});

Then(`screen does not contain any proprietaryNames`, function () {
    for (let rowindex = 0, rows = proprietaryNames.length; rowindex < rows; rowindex++) {
        cy.log(proprietaryNames[rowindex][0]);
        cy.get('body').should('not.contain', proprietaryNames[rowindex][0]);
    }
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

Then(/^The "(.*?)" field border is displayed in green/, function (formField) {
    cy.getFormGroup(formField).find('input.valid').should('be.visible');
    cy.getFormGroup(formField).find('input').should('have.css', 'border-color', 'rgb(37, 145, 94)');
});

Then(/^A green checkmark inside the "(.*?)" field is displayed/, function (formField) {
    cy.getFormGroup(formField).find('i.oi.oi-circle-check').should('be.visible');
    cy.getFormGroup(formField).find('i.text-valid').should('have.css', 'color', 'rgb(47, 186, 120)');
});

Then(/^I shall not be displayed any errors or validation markup on non required field "(.*?)"/, function (formField) {
    cy.getFormGroup(formField).find('input.valid').should('not.be.visible');
    cy.getFormGroup(formField).find('input').should('not.have.css', 'border-color', 'rgb(37, 145, 94)');
    cy.getFormGroup(formField).find('i.oi.oi-circle-check').should('not.be.visible');
    cy.getFormGroup(formField).find('i.text-valid').should('not.have.css', 'color', 'rgb(47, 186, 120)');
});
