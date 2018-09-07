/* global cy, Cypress, then, when, given */
/// <reference types="Cypress" />


Given(`I am a user on the ex flow`, () => {
    cy.wrap({
        flowName: 'ex',
        textBlack: 'rgb(73, 80, 87)',
        validGreen: 'rgb(37, 145, 94)',
        errorRedBorder: 'rgb(203, 18, 62)',
        errorRed: 'rgb(203, 18, 62) none repeat scroll 0% 0% / auto padding-box border-box',
        errorSelector: '.popover-body',
        errorClass: '.invalid'
    }).as('flow');
    cy.visit( 'ex/?marketingid=00001');
    cy.wait(200);
});

When(`I am on the ex landing page`, () => {
    cy.visit('/ex/lp').getElement('landing-page-section').should('be.visible');
});

Then(`I am guided to the ex landing page`, () => {
    cy.url().should('contain','/ex/lp').getElement('landing-section').should('be.visible');
});

When(`I am on the ex step1 signup page`, () => {
    cy.visit('/ex/signup').getElement('signup-section').should('be.visible');
});

Then(`I am guided to the ex step1 signup page`, () => {
    cy.url().should('contain','/ex/signup').getElement('signup-section').should('be.visible');
});

When(`I am on the ex step2 form page`, () => {
    cy.visit('/ex/account').getElement('account-section').should('be.visible');
});

Then(`I am guided to the ex step2 form page`, () => {
    cy.url().should('contain','/ex/account').getElement('account-section').should('be.visible');
});

When(`I am on the ex step3 confirm page`, () => {
    cy.visit('/ex/authenticate').getElement('authenticate-section').should('be.visible');
});

Then(`I am guided to the ex step3 confirm page`, () => {
    cy.url().should('contain','/ex/authenticate').getElement('authenticate-section').should('be.visible');
});

When(`I am on the ex step4 verify page`, () => {
    cy.visit('/ex/verify').getElement('verify-section').should('be.visible');
});

Then(`I am guided to the ex step4 verify page`, () => {
    cy.url().should('contain','/ex/verify').getElement('verify-section').should('be.visible');
});

When(`I am on the ex portal page`, () => {
    cy.visit('/ex/portal/home').getElement('portal-page-section').should('be.visible');
});

Then(`I am guided to the ex portal page`, () => {
    cy.url().should('contain','/ex/portal/home').getElement('portal-page-section').should('be.visible');
});

When(`I am on the ex Privacy Policy screen`, () => {
    cy.visit('/ex/privacy').getElement('privacy-section').should('be.visible');
});

Then(`I am guided to the ex Privacy Policy screen`, () => {
    cy.url().should('contain','/ex/privacy').getElement('privacy-section').should('be.visible');
});

When(`I am on the ex Terms of Service screen`, () => {
    cy.visit('/ex/tos').getElement('tos-section').should('be.visible');
});

Then(`I am guided to the ex Terms of Service screen`, () => {
    cy.url().should('contain','/ex/tos').getElement('tos-section').should('be.visible');
});
