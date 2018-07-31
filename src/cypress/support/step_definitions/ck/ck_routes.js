/* global cy, Cypress, then, when, given */
/// <reference types="Cypress" />

const flow = 'ck/';

Given(`I am a user on the ck flow`, () => {
    cy.visit(flow);
});

When(`I am on the ck landing page`, () => {
    cy.visit('/ck/landing').get('.landing-page').should('be.visible');
});

Then(`I am guided to the ck landing page`, () => {
    cy.url().should('contain','/ck/landing').get('.landing-page').should('be.visible');
});

When(`I am on the ck step1 signup page`, () => {
    cy.visit('/ck/signUp').get('.sign-up-page').should('be.visible');
});

Then(`I am guided to the ck step1 signup page`, () => {
    cy.url().should('contain','/ck/landing').get('.sign-up-page').should('be.visible');
});

When(`I am on the ck step2 form page`, () => {
    cy.visit('/ck/info').get('.credit-form-page').should('be.visible');
});

Then(`I am guided to the ck step2 form page`, () => {
    cy.url().should('contain','/ck/landing').get('.credit-form-page').should('be.visible');
});

When(`I am on the ck step3 confirm page`, () => {
    cy.visit('/ck/kba').get('.confirm-page').should('be.visible');
});

Then(`I am guided to the ck step3 confirm page`, () => {
    cy.url().should('contain','/ck/landing').get('.confirm-page').should('be.visible');
});

When(`I am on the ck portal page`, () => {
    cy.visit('/ck/portal/home').get('[data-test="portal-nav"]').should('be.visible');
});

Then(`I am guided to the ck portal page`, () => {
    cy.url().should('contain','/ck/landing').get('[data-test="portal-nav"]').should('be.visible');
});

When(`I am on the ck Privacy Policy screen`, () => {
    cy.visit('/ck/privacy').get('.privacy').should('be.visible');
});

Then(`I am guided to the ck Privacy Policy screen`, () => {
    cy.url().should('contain','/ck/landing').get('.privacy').should('be.visible');
});

When(`I am on the ck Terms of Service screen`, () => {
    cy.visit('/ck/tos').get('.tos').should('be.visible');
});

Then(`I am guided to the ck Terms of Service screen`, () => {
    cy.url().should('contain','/ck/landing').get('.tos').should('be.visible');
});
