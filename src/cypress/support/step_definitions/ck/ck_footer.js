/* global cy, Cypress, then, when, given */
/// <reference types="Cypress" />

const flow = '/ck/';

Then(/^I am displayed "(.*?)" Hyperlinked to "(.*?)"$/, (linkText, linkUrl) => {
    cy.get('footer a[href="'+linkUrl+'"]').contains(linkText);
});

Then(`I am displayed ck Footer`, () => {
    cy.get('footer').should('be.visible');
    cy.getElement('copyright-text').should('be.visible');
});

Then(/^"(.*?)" Hyperlinked targets opening in a new tab$/, (linkUrl) => {
    cy.get('footer a[href="'+linkUrl+'"][target="_blank"]').should('be.visible');
});

let siteName = 'TestSite';
Given(/^the siteName is "(.*?)"$/, (providedSiteName) => {
    siteName = providedSiteName;
    cy.log('siteName',siteName)
});

Then(`I am displayed Copyright - © 2018 siteName. All Rights Reserved in the footer`, () => {
    cy.getElement('copyright-text').should('be.visible');
    cy.get('footer').contains('© 2018 '+siteName+'. All Rights Reserved');
});

Then(`I am displayed siteName in the header`, () => {
    cy.get('nav.navbar [data-test="site-link"]').should('contain', siteName);
});

Then(`I am displayed ck Logo`, () => {
    cy.get('nav.navbar [data-test="site-link"]').should('contain', siteName);
});

Then(`I am displayed ck Terms of Service Text`, () => {
    cy.getElement('section-title').contains('Terms of Use');
    cy.get('body').contains('BY USING THE WEBSITE AND THE SERVICES AND/OR REQUESTING THAT WE CONTACT YOU ABOUT OUR SERVICES,');
    cy.get('body').contains('If you do not understand any of the foregoing Terms of Use or if you have any questions or comments, we encourage you to contact us via written correspondence');
});

Then(/^I am displayed ck Privacy Policy Text$/, () => {
    cy.getElement('section-title').contains('Privacy Policy');
    cy.get('body').contains('We Are Committed to Safeguarding Customer Information');
    cy.get('body').contains('Should you have any questions about Privacy, please contact:');
});

Then(`I am displayed the following on the 'right rail'`, () => {
    cy.get('.sidebar').should('be.visible');
    // Header:
    cy.get('.sidebar .row h2').contains('A Truly Free Credit Score');
    //Description:
    cy.get('.sidebar .row p').contains(siteName+' is free, forever. We will never ask you for your credit card or payment information.');
    // Header:
    cy.get('.sidebar .row h2').contains('Will This Affect My Credit?');
    //Description:
    cy.get('.sidebar .row p').contains('Absolutely not! Checking your score on '+siteName+' is a soft inquiry, which will never affect your credit.');
});
