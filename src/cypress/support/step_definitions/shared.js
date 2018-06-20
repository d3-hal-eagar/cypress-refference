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