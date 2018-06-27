/* global cy, then, when, given */

then(`I see {string} in the title`, (title) => {
    cy.title().should('include', title);
});
then(`take screenshot named {string}`, (filename) => {
    cy.screenshot(filename);
});
then("take screenshot", () =>{
    cy.screenshot();
});
when('I am on the {string} page', (pageName) => {
    // no host info, so it will use baseURL as set in cypress.json or env variable CYPRESS_baseURL
    cy.visit(pageName);
});

when('I select {string}', (buttonText) => {
    cy.contains(buttonText).click();
});
