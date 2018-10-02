/* global cy, Cypress, then, when, given */
/// <reference types="Cypress" />

Then(/^I incorrectly fill out kba questions$/, function () {
    //todo better selectors
    cy.get(':nth-child(3) > .questions-options > :nth-child(1) > .ng-untouched').click();
    cy.get(':nth-child(4) > .questions-options > :nth-child(1) > .ng-untouched').click();
    cy.get(':nth-child(5) > .questions-options > :nth-child(1) > .ng-untouched').click();
});

Then(/^I correctly fill out kba questions$/, function () {
    //todo really answer in some form of correct
    cy.get(':nth-child(3) > .questions-options > :nth-child(1) > .ng-untouched').click();
    cy.get(':nth-child(4) > .questions-options > :nth-child(2) > .ng-untouched').click();
    cy.get(':nth-child(5) > .questions-options > :nth-child(3) > .ng-untouched').click();
});

Then(/^The cfs "(.*?)" field label is "(.*?)" on the mobile page only$/, (formField,labelText) => {
    if (Cypress.env('TESTMODE') === 'mobile') {
        cy.getFormGroup(formField).find('label').contains(labelText).should('be.visible');
    } else {
        cy.get('label[data-test='+formField+'-label]').should('not.be.visible');
    }
});
