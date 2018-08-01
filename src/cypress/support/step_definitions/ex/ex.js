/* global cy, Cypress, then, when, given */
/// <reference types="Cypress" />

const flow = 'ex/';

Then(`I shall be displayed the ex Progress Bar with Step1 highlighted in green as seen in the design`, () => {
    cy.get('.progress-bar .step.complete').should('have.length', 1);
    cy.get('.progress-bar .step.complete').should('contain','Step 1');
    cy.get('.progress-bar .step.complete').should('not.contain','Step 2');
    cy.get('.progress-bar .step.complete').should('not.contain','Step 3');
    cy.get('.progress-bar .step.complete').should('not.contain','Step 4');
});

Then(`I shall be displayed the ex Progress Bar with Step2 highlighted in green as seen in the design`, () => {
    cy.get('.progress-bar .step.complete').should('have.length', 2);
    cy.get('.progress-bar .step.complete').should('contain','Step 1');
    cy.get('.progress-bar .step.complete').should('contain','Step 2');
    cy.get('.progress-bar .step.complete').should('not.contain','Step 3');
    cy.get('.progress-bar .step.complete').should('not.contain','Step 4');
});

Then(`I shall be displayed the ex Progress Bar with Step3 highlighted in green as seen in the design`, () => {
    cy.get('.progress-bar .step.complete').should('have.length', 3);
    cy.get('.progress-bar .step.complete').should('contain','Step 1');
    cy.get('.progress-bar .step.complete').should('contain','Step 2');
    cy.get('.progress-bar .step.complete').should('contain','Step 3');
    cy.get('.progress-bar .step.complete').should('not.contain','Step 4');
});

Then(`I shall be displayed the ex Progress Bar with Step4 highlighted in green as seen in the design`, () => {
    cy.get('.progress-bar .step.complete').should('have.length', 4);
    cy.get('.progress-bar .step.complete').should('contain','Step 1');
    cy.get('.progress-bar .step.complete').should('contain','Step 2');
    cy.get('.progress-bar .step.complete').should('contain','Step 3');
    cy.get('.progress-bar .step.complete').should('contain','Step 4');
});

Then(`I shall not be displayed the ex Progress Bar`, () => {
    cy.get('.progress-bar').should('not.be.visible');
});

Then(/^The "(.*?)" field border is outlined in red color/, function (formField) {
    cy.getFormGroup(formField).find('input.invalid').should('be.visible');
    cy.getFormGroup(formField).find('input').should('have.css', 'border-color', 'rgb(203, 18, 62)');
});

Then(/^A red warning icon inside the "(.*?)" field is displayed/, function (formField) {
    cy.getFormGroup(formField).find('i.oi.oi-warning').should('be.visible');
    cy.getFormGroup(formField).find('i.text-invalid').should('have.css', 'color', 'rgb(203, 18, 62)');
});