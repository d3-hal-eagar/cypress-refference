/* global cy, Cypress, then, when, given */
/// <reference types="Cypress" />

let flow = 'ck/';

Given(`I am a user on the ck flow`, () => {
    flow = 'ck/';
    cy.visit( flow+'?marketingid=00000');
    cy.wait(200);
});

When(`I am on the ck landing page`, () => {
    cy.visit('/ck/landing').getElement('landing-page-section').should('be.visible');
});

Then(`I am guided to the ck landing page`, () => {
    cy.url().should('contain','/ck/landing').getElement('landing-page-section').should('be.visible');
});

When(`I am on the ck step1 signup page`, () => {
    cy.visit('/ck/signUp').getElement('sign-up-section').should('be.visible');
    //cy.getElement('header-signup-button').click().url().should('contain','/ck/signUp').getElement('sign-up-section').should('be.visible');
});

Then(`I am guided to the ck step1 signup page`, () => {
    cy.url().should('contain','/ck/signUp').getElement('sign-up-section').should('be.visible');
});

When(`I am on the ck step2 form page`, () => {
    cy.visit('/ck/info').getElement('credit-form-section').should('be.visible');
});

Then(`I am guided to the ck step2 form page`, () => {
    cy.url().should('contain','/ck/info').getElement('credit-form-section').should('be.visible');
});

When(`I am on the ck step3 confirm page`, () => {
    cy.visit('/ck/kba').getElement('confirm-page-section').should('be.visible');
});

Then(`I am guided to the ck step3 confirm page`, () => {
    cy.url().should('contain','/ck/kba').getElement('confirm-page-section').should('be.visible');
});

When(`I am on the ck portal page`, () => {
    cy.visit('/ck/portal/home').getElement('portal-nav').should('be.visible');
});

Then(`I am guided to the ck portal page`, () => {
    cy.url().should('contain','/ck/portal/home').getElement('portal-nav').should('be.visible');
});

When(`I am on the ck Privacy Policy screen`, () => {
    cy.visit('/ck/privacy').getElement('privacy-section').should('be.visible');
});

Then(`I am guided to the ck Privacy Policy screen`, () => {
    cy.url().should('contain','/ck/privacy').getElement('privacy-section').should('be.visible');
});

When(`I am on the ck Terms of Service screen`, () => {
    cy.visit('/ck/tos').getElement('tos-section').should('be.visible');
});

Then(`I am guided to the ck Terms of Service screen`, () => {
    cy.url().should('contain','/ck/tos').getElement('tos-section').should('be.visible');
});
