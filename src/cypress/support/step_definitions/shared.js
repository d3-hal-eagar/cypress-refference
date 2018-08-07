/* global cy, then, when, given */

Then (/^nothing happens$/, () => {

});

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

Then(/^The page header is "(.*?)"$/, (headerText) => {
    cy.getElement('section-title').contains(headerText).should('be.visible');
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

Then(/^The "(.*?)" message contains "(.*?)"$/, (element, messageText) => {
    cy.getElement(element).should('contain', messageText);
});
