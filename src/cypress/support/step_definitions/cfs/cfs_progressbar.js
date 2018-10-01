/* global cy, Cypress, then, when, given */
/// <reference types="Cypress" />

const CFS_backgroundBlue = 'rgb(15, 50, 115)';
const CFS_backgroundWhite = 'rgb(255, 255, 255)';

Then(`I shall be displayed the Progress Bar Indicator as 'Step 1 - COMPLETE' as seen on the design`, () => {
    if (Cypress.env('TESTMODE') === 'mobile') {
        cy.getChildElement('progress-section','step-1').should('have.class', 'active').and('contain','Step 1 - Complete');
        cy.get('[data-test=step-1]>span').should('have.css', 'background-color', CFS_backgroundWhite);
        cy.getChildElement('progress-section','step-2').should('not.be.visible');
        cy.getChildElement('progress-section','step-3').should('not.be.visible');
        cy.getChildElement('progress-section','step-4').should('not.be.visible');
    } else {
        cy.get('[data-test=step-1]>span').should('have.css', 'background-color', CFS_backgroundWhite);
        cy.getChildElement('progress-section','step-2').should('not.have.class', 'active');
        cy.get('[data-test=step-2]>span').should('have.css', 'background-color', CFS_backgroundBlue);
        cy.getChildElement('progress-section','step-3').should('not.have.class', 'active');
        cy.get('[data-test=step-3]>span').should('have.css', 'background-color', CFS_backgroundBlue);
        cy.getChildElement('progress-section','step-4').should('not.have.class', 'active');
        cy.get('[data-test=step-4]>span').should('have.css', 'background-color', CFS_backgroundBlue);
    }

});

Then(`I shall be displayed the Progress Bar Indicator as 'Step 2 - CONFIRM' as seen on the design`, () => {
    if (Cypress.env('TESTMODE') === 'mobile') {
        cy.getChildElement('progress-section','step-1').should('not.be.visible');
        cy.getChildElement('progress-section', 'step-2').should('have.class', 'active').and('contain', 'Step 2 - Confirm');
        cy.get('[data-test=step-2]>span').should('have.css', 'background-color', CFS_backgroundWhite);
        cy.getChildElement('progress-section','step-3').should('not.be.visible');
        cy.getChildElement('progress-section','step-4').should('not.be.visible');
    } else {
        cy.getChildElement('progress-section', 'step-1').should('have.class', 'active');
        cy.get('[data-test=step-1]>span').should('have.css', 'background-color', CFS_backgroundWhite);
        cy.getChildElement('progress-section', 'step-2').should('have.class', 'active').and('contain', 'Step 2 - Confirm');
        cy.get('[data-test=step-2]>span').should('have.css', 'background-color', CFS_backgroundWhite);
        cy.getChildElement('progress-section', 'step-3').should('not.have.class', 'active');
        cy.get('[data-test=step-3]>span').should('have.css', 'background-color', CFS_backgroundBlue);
        cy.getChildElement('progress-section', 'step-4').should('not.have.class', 'active');
        cy.get('[data-test=step-4]>span').should('have.css', 'background-color', CFS_backgroundBlue);
    }
});

Then(`I shall be displayed the Progress Bar Indicator as 'Step 3 - VERIFY' as seen on the design`, () => {
    if (Cypress.env('TESTMODE') === 'mobile') {
        cy.getChildElement('progress-section','step-1').should('not.be.visible');
        cy.getChildElement('progress-section','step-2').should('not.be.visible');
        cy.getChildElement('progress-section','step-3').should('have.class', 'active').and('contain','Step 3 - Verify');
        cy.get('[data-test=step-3]>span').should('have.css', 'background-color', CFS_backgroundWhite);
        cy.getChildElement('progress-section','step-4').should('not.be.visible');
    } else {
        cy.getChildElement('progress-section', 'step-1').should('have.class', 'active');
        cy.get('[data-test=step-1]>span').should('have.css', 'background-color', CFS_backgroundWhite);
        cy.getChildElement('progress-section', 'step-2').should('have.class', 'active');
        cy.get('[data-test=step-2]>span').should('have.css', 'background-color', CFS_backgroundWhite);
        cy.getChildElement('progress-section', 'step-3').should('have.class', 'active').and('contain', 'Step 3 - Verify');
        cy.get('[data-test=step-3]>span').should('have.css', 'background-color', CFS_backgroundWhite);
        cy.getChildElement('progress-section', 'step-4').should('not.have.class', 'active');
        cy.get('[data-test=step-4]>span').should('have.css', 'background-color', CFS_backgroundBlue);
    }
});

Then(`I shall be displayed the Progress Bar Indicator as 'Step 4 - AUTHENTICATION' as seen on the design`, () => {
    if (Cypress.env('TESTMODE') === 'mobile') {
        cy.getChildElement('progress-section','step-1').should('not.be.visible');
        cy.getChildElement('progress-section','step-2').should('not.be.visible');
        cy.getChildElement('progress-section','step-3').should('not.be.visible');
        cy.getChildElement('progress-section','step-4').should('have.class', 'active').and('contain', 'Step 4 - Authentication');
        cy.get('[data-test=step-4]>span').should('have.css', 'background-color', CFS_backgroundWhite);
    } else {
        cy.getChildElement('progress-section', 'step-1').should('have.class', 'active');
        cy.get('[data-test=step-1]>span').should('have.css', 'background-color', CFS_backgroundWhite);
        cy.getChildElement('progress-section', 'step-2').should('have.class', 'active');
        cy.get('[data-test=step-2]>span').should('have.css', 'background-color', CFS_backgroundWhite);
        cy.getChildElement('progress-section', 'step-3').should('have.class', 'active');
        cy.get('[data-test=step-3]>span').should('have.css', 'background-color', CFS_backgroundWhite);
        cy.getChildElement('progress-section', 'step-4').should('have.class', 'active').and('contain', 'Step 4 - Authentication');
        cy.get('[data-test=step-4]>span').should('have.css', 'background-color', CFS_backgroundWhite);
    }
});

Then(`I shall not be displayed the Progress Bar Indicator as Step 4 - VIEW`, () => {
    cy.getElement('progress-section').should('not.be.visible');
});
