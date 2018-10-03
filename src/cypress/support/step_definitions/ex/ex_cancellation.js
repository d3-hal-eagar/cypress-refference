/* global cy, Cypress, then, when, given, Then, When, Given  */
/// <reference types="Cypress" />
(function() {
    "use strict";

    Then(`I am shown an error apology`, () => {
        cy.get('.modal');

        // Header:
        cy.get('.modal h1').contains('Oops, we\'re sorry!');
        // Description Text:
        cy.get('.modal p').contains('We\'re sorry, but we have encountered an error.');
        cy.get('.modal p').contains('We apologize for the issue and have notified the applicable department.');
    });

    Then(`I am shown an error and cancel the registration process`, () => {

    });

    Then(`I am shown an error and about protecting your personal information`, () => {
        cy.get('@flow').then((flow) => {
            cy.get('.modal');

            // Header:
            cy.get('.modal h1').contains('Oops, we\'re sorry!');
            // Description Text:
            cy.get('.modal p').contains(flow.siteName);
            cy.get('.modal p').contains('is committed to protecting your personal information. We utilize a thorough identity verification system because your security is important to us. Unfortunately, we have not been able to properly identify you from the information you provided. Please note that your order has been canceled.');
        });
    });
})();
