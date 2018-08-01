/* global cy, Cypress, then, when, given */
/// <reference types="Cypress" />

const flow = 'ex/';

Given(`I am a user on the ex flow`, () => {
    cy.visit(flow);
});

When(`I am on the ex landing page`, () => {
    cy.visit('/ex/lp').get('.landing-page').should('be.visible');
});

When(`I am on the ex step1 signup page`, () => {
    cy.visit('/ex/signup').get('.sign-up-page').should('be.visible');
});

When(`I am on the ex step2 form page`, () => {
    cy.visit('/ex/account').get('.account-page').should('be.visible');
});

When(`I am on the ex step3 confirm page`, () => {
    cy.visit('/ex/authenticate').get('.account-page').should('be.visible');
});

When(`I am on the ex step4 verify page`, () => {
    cy.visit('/ex/verify').get('.account-page').should('be.visible');
});

When(`I am on the ex portal page`, () => {
    cy.visit('/ex/portal/home').get('.portal-page').should('be.visible');
});

When(`I am on the ex Privacy Policy screen`, () => {
    cy.visit('/ex/privacy').get('.privacy').should('be.visible');
});

When(`I am on the ex Terms of Service screen`, () => {
    cy.visit('/ex/tos').get('.tos').should('be.visible');
});
