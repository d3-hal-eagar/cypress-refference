/* global cy, Cypress, then, when, given */
/// <reference types="Cypress" />


Given(`I am a user on the cfs flow`, () => {
    //www.notcheckfreescore.local
    cy.wrap({
        flowName: 'cfs',
        validGreen: 'rgb(00, FF, 00)',
        errorRedBorder: 'rgb(FF, 00, 00)',
        errorRed: 'rgb(FF, 00, 00)',
        errorSelector: '.validation-error',
        errorClass: '.invalid',
        siteName: 'IasadGeas'
    }).as('flow');
    cy.visit( '?marketingid=000');
    cy.wait(200);
});

When(`I am on the cfs landing page`, () => {
    cy.visit('/cfs/landing').getElement('landing-page-section').should('be.visible');
});

Then(`I am guided to the cfs landing page`, () => {
    cy.url().should('contain','/cfs/landing').getElement('landing-section').should('be.visible');
});

When(`I am on the cfs step1 page`, () => {
    cy.visit('/cfs/complete').getElement('complete-section').should('be.visible');
});

Then(`I am guided to the cfs step1 page`, () => {
    cy.url().should('contain','/cfs/complete').getElement('complete-section').should('be.visible');
});

When(`I am on the cfs step2 page`, () => {
    cy.visit('/cfs/confirm').getElement('confirm-section').should('be.visible');
});

Then(`I am guided to the cfs step2 page`, () => {
    cy.url().should('contain','/cfs/confirm').getElement('confirm-section').should('be.visible');
});

When(`I am on the cfs step3 page`, () => {
    cy.visit('/cfs/verify').getElement('verify-section').should('be.visible');
});

Then(`I am guided to the cfs step3 page`, () => {
    cy.url().should('contain','/cfs/verify').getElement('verify-section').should('be.visible');
});

When(`I am on the cfs step4 page`, () => {
    cy.visit('/cfs/kba').getElement('authentication-section').should('be.visible');
});

Then(`I am guided to the cfs step4 page`, () => {
    cy.url().should('contain','/cfs/kba').getElement('authentication-section').should('be.visible');
});

When(`I am on the cfs portal page`, () => {
    cy.visit('/cfs/portal/home').getElement('portal-page-section').should('be.visible');
});

Then(`I am guided to the cfs portal page`, () => {
    cy.url().should('contain','/cfs/portal/home').getElement('portal-page-section').should('be.visible');
});

When(`I am on the cfs Privacy Policy screen`, () => {
    cy.visit('/cfs/privacy').getElement('privacy-section').should('be.visible');
});

Then(`I am guided to the cfs Privacy Policy screen`, () => {
    cy.url().should('contain','/cfs/privacy').getElement('privacy-section').should('be.visible');
});

When(`I am on the cfs Terms of Service screen`, () => {
    cy.visit('/cfs/tos').getElement('tos-section').should('be.visible');
});

Then(`I am guided to the cfs Terms of Service screen`, () => {
    cy.url().should('contain','/cfs/tos').getElement('tos-section').should('be.visible');
});
