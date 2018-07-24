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

Then(/^The page header is "(.*?)"$/, (headerText) => {
    cy.get('h1').contains(headerText).should('be.visible');
});
