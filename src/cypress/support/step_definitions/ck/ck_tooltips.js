/* global cy, Cypress, then, when, given */
/// <reference types="Cypress" />

const flow = 'ck/';


Then(/^I am displayed a "(.*?)" tooltip - "(.*?)" on desktop only$/, function (formField, tooltipText) {
    if (Cypress.env('TESTMODE') === 'mobile') {
        cy.getFormGroup(formField).find('[role="tooltip"]').should('not.be.visible');
    } else {
        cy.getFormGroup(formField).find('[role="tooltip"]').contains(tooltipText);
    }
});

Then(/^"(.*?)" tooltip is not visible$/, function (formField) {
    cy.getFormGroup(formField).find('[role="tooltip"]').should('not.be.visible');
});


Then(/^I am displayed a attribute title on "(.*?)" field - "(.*?)"$/, function (formField, tooltipText) {
    cy.getElement(formField).should('have.attr', 'title', tooltipText);
});

Then(/^"(.*?)" field attribute title is not visible$/, function (formField) {
    cy.getElement(formField).should('have.attr', 'title', '');
});

When(/^I hover over "(.*?)" address$/, function (formField) {
    cy.getElement(formField).trigger('mouseover');
});

Then(/^"(.*?)" tooltip is not visible$/, function (formField) {
    cy.getFormGroup(formField).find('[role="tooltip"]').should('not.be.visible');
});


Then(/^I am displayed a attribute title on "(.*?)" field - "(.*?)"$/, function (formField, tooltipText) {
    cy.getElement(formField).should('have.attr', 'title', tooltipText);
});

Then(/^"(.*?)" field attribute title is not visible$/, function (formField) {
    cy.getElement(formField).should('have.attr', 'title', '');
});

When(/^I hover over "(.*?)" address$/, function (formField) {
    cy.getElement(formField).trigger('mouseover');
});

