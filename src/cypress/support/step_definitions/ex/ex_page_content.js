/* global cy, Cypress, then, when, given */
/// <reference types="Cypress" />

const flow = '/ex/';

let siteName = 'TestSite';

Then(`I am displayed the correct blocks on the ex Step 1 right rail`, () => {
    //D3F-381
    cy.get('.col-lg-5').should('be.visible');
    // Header:
    cy.get('.col-lg-5 [data-test=aside-order] h4').contains('When you order today, you’ll get:');
    //Description:
    cy.get('.col-lg-5 [data-test=aside-order] ul li').contains('Free TransUnion Credit Report');
    cy.get('.col-lg-5 [data-test=aside-order] ul li').contains('See The Latest TransUnion Credit Information');
    cy.get('.col-lg-5 [data-test=aside-order] ul li').contains('Stay Up To Date on Changes');
    cy.get('.col-lg-5 [data-test=aside-order] ul li').contains('Act Quickly If Issues Are Found');
    cy.get('.col-lg-5 [data-test=aside-order] ul li').contains('Identify Possible Negative Items');
    // Header:
    cy.get('.col-lg-5 [data-test=aside-free] h4').contains('Completely Free and Easy');
    //Description:
    cy.get('.col-lg-5 [data-test=aside-free] p').contains('No purchase or credit card required. Checking your own credit will NOT hurt your credit scores.');

    // Header:
    cy.get('.col-lg-5 [data-test=aside-safe] h4').contains('Safe and Secure');
    //Description:
    cy.get('.col-lg-5 [data-test=aside-safe] p').contains('The information you provide will be transferred to us through a private secure connection.');

    cy.get('.col-lg-5 [data-test=aside-secure] img').should('be.visible');
});
