/* global cy, Cypress, then, when, given */
/// <reference types="Cypress" />

const flow = 'ck/';


When(/^I select the Show button$/, function () {
    cy.get('.showhide-pw').contains('Show').click();
});

When(/^I select the Hide button$/, function () {
    cy.get('.showhide-pw').contains('Hide').click();
});

Then(/^"(.*?)" field displays as plain text$/, function (formField) {
    cy.getElement(formField).should('have.attr', 'type', 'text');
});

Then(/^"(.*?)" field has masked characters$/, function (formField) {
    cy.getElement(formField).should('have.attr', 'type', 'password');
});
