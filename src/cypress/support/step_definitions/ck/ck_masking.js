/* global cy, Cypress, then, when, given */
/// <reference types="Cypress" />

When(/^I select the Show button$/, function () {
    cy.getElement('password-toggle').contains('Show').click();
});

When(/^I select the Hide button$/, function () {
    cy.getElement('password-toggle').contains('Hide').click();
});

Then(/^"(.*?)" field displays as plain text$/, function (formField) {
    cy.getElement(formField).should('have.attr', 'type', 'text');
});

Then(/^"(.*?)" field has masked characters$/, function (formField) {
    cy.getElement(formField).should('have.attr', 'type', 'password');
});

Then(/^I shall be displayed the "(.*?)", "(.*?)" and "(.*?)" fields in the XXX-XX-___ format$/, function (formField1, formField2, formField3) {
    cy.getElement(formField1)
        .should('be.visible')
        .should('have.attr', 'type', 'text')
        .should('have.attr', 'maxlength', '3')
        .should('be.disabled');
    cy.getElement(formField2)
        .should('be.visible')
        .should('have.attr', 'type', 'text')
        .should('have.attr', 'maxlength', '2')
        .should('be.disabled');
    cy.getElement(formField3)
        .should('be.visible')
        .should('have.attr', 'type', 'password')
        .should('have.attr', 'maxlength', '4')
        .should('not.be.disabled')
        .should('be.empty');
});

Then(/^I shall be displayed the "(.*?)" ssn-input field$/, function (formField) {
    cy.getElement(formField).should('be.visible')
        .should('have.attr', 'type', 'password')
        .should('have.attr', 'numbersonly')
        .should('not.be.disabled')
        .should('be.empty');
});
