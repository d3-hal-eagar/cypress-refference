/* global cy, then, when, given */

Then(`I see {string} in the title`, (title) => {
    cy.title().should('include', title);
});
Then(`take screenshot named {string}`, (filename) => {
    cy.screenshot(filename);
});
Then("take screenshot", () =>{
    cy.screenshot();
});
When('I am on the {string} page', (pageName) => {
    // no host info, so it will use baseURL as set in cypress.json or env variable CYPRESS_baseURL
    cy.visit(pageName);
});

When('I select {string}', (buttonText) => {
    cy.contains(buttonText).click();
});
