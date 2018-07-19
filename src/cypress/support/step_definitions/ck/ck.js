/* global cy, Cypress, then, when, given */
/// <reference types="Cypress" />

const flow = 'ck/';

Then(`I shall be displayed the Progress Bar with Step1 highlighted in green as seen in the design`, () => {
    cy.get('.progress-section .step.active').should('have.length', 1);
    cy.get('.progress-section .step.active').should('contain','STEP 1');
    cy.get('.progress-section .step.active').should('not.contain','STEP 2');
    cy.get('.progress-section .step.active').should('not.contain','STEP 3');
});

Then(`I shall be displayed the Progress Bar with Step2 highlighted in green as seen in the design`, () => {
    cy.get('.progress-section .step.active').should('have.length', 2);
    cy.get('.progress-section .step.active').should('contain','STEP 1');
    cy.get('.progress-section .step.active').should('contain','STEP 2');
    cy.get('.progress-section .step.active').should('not.contain','STEP 3');
});

Then(`I shall be displayed the Progress Bar with Step3 highlighted in green as seen in the design`, () => {
    cy.get('.progress-section .step.active').should('have.length', 3);
    cy.get('.progress-section .step.active').should('contain','STEP 1');
    cy.get('.progress-section .step.active').should('contain','STEP 2');
    cy.get('.progress-section .step.active').should('contain','STEP 3');
});

Then(`I shall not be displayed the Progress Bar`, () => {
    cy.get('.progress-section').should('not.be.visible');
});
