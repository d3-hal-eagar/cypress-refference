/* global cy, Cypress, then, when, given, Then, When, Given  */
/// <reference types="Cypress" />
(function() {
    "use strict";

    When(`I am on the cfs landing page`, () => {
        cy.visit('/cfs/landing').getElement('landing-page-section').should('be.visible');
    });

    Then(`I am guided to the cfs landing page`, () => {
        cy.wait(200).url().should('contain','/cfs/landing').getElement('landing-page-section').should('be.visible');
    });

    When(`I am on the cfs step1 page`, () => {
        cy.visit('/cfs/complete').getElement('complete-section').should('be.visible');
    });

    Then(`I am guided to the cfs step1 page`, () => {
        cy.wait(200).url().should('contain','/cfs/complete').getElement('complete-section').should('be.visible');
    });

    When(`I am on the cfs step2 page`, () => {
        cy.visit('/cfs/confirm').getElement('confirm-section').should('be.visible');
    });

    Then(`I am guided to the cfs step2 page`, () => {
        cy.wait(200).url().should('contain','/cfs/confirm').getElement('confirm-section').should('be.visible');
    });

    // When(`I am on the cfs step3 page`, () => {
    //     cy.visit('/cfs/verify').getElement('verify-section').should('be.visible');
    // });
    //
    // Then(`I am guided to the cfs step3 page`, () => {
    //     cy.wait(200).url().should('contain','/cfs/verify').getElement('verify-section').should('be.visible');
    // });

    When(`I am on the cfs step3A authentication page`, () => {
        cy.visit('/cfs/kba').getElement('kba-section').should('be.visible');
    });

    Then(`I am guided to the cfs step3A authentication page`, () => {
        cy.wait(200).url().should('contain','/cfs/kba').getElement('kba-section').should('be.visible');
    });

    When(`I am on the cfs step4 view page`, () => {
        cy.visit('/cfs/auth/home').getElement('portal-home-section').should('be.visible');
    });

    Then(`I am guided to the cfs step4 view page`, () => {
        cy.wait(200).url().should('contain','/cfs/auth/home').getElement('portal-home-section').should('be.visible');
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

    Then(`I am guided to PORTAL_KBA_EXIT`, () => {
        cy.url().should('contain','/assets/kbaFailUrl.txt');
    });

    Then(`I am guided to PORTAL_LOGIN_EXIT`, () => {
        cy.url().should('contain','/assets/loginUrl.txt');
    });

})();
