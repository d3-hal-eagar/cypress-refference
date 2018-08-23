/* global cy, Cypress, then, when, given */
/// <reference types="Cypress" />

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

let siteName = 'IasadGeas';
Given(/^make siteName is "(.*?)"$/, (providedSiteName) => {
    siteName = providedSiteName;
    cy.log('siteName',siteName);
    cy.fixture('ck_matrix.json').as('matrixJSON');
    cy.server();           // enable response stubbing
    cy.route({
        method: 'GET',      // Route all GET requests
        url: '/api/v1/matrix/*/00000',    // that have a URL that matches
        response: '@matrixJSON'        // and force the response to be:
    }).as('matrixCall');
    //cy.wait(['@matrixCall']);
});

Given(/^the siteName is "(.*?)"$/, (providedSiteName) => {
    siteName = providedSiteName;
    cy.log('siteName',siteName);
});

Then(/^The "(.*?)" message contains siteName$/, function (element) {
    cy.getElement(element).should('contain', siteName);
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


Then(`I am displayed the correct blocks on the ck Step 1 right rail`, () => {
    //D3F-217
    cy.get('.sidebar').should('be.visible');
    // Header:
    cy.get('.sidebar [data-test=score-sidebar-section] h2').contains('A Truly Free Credit Score');
    //Description:
    cy.get('.sidebar [data-test=score-sidebar-section] p').contains(siteName+' is free, forever. We will never ask you for your credit card or payment information.');
    // Header:
    cy.get('.sidebar [data-test=credit-sidebar-section] h2').contains('Will This Affect My Credit?');
    //Description:
    cy.get('.sidebar [data-test=credit-sidebar-section] p').contains('Absolutely not! Checking your score on '+siteName+' is a soft inquiry, which will never affect your credit.');
});

Then(`I am displayed the correct blocks on the ck Step 2 right rail`, () => {
    //D3F-218
    cy.get('.sidebar').should('be.visible');
    // Header:
    cy.get('.sidebar .row h2').contains('Why Do You Need My Information?');
    //Description:
    cy.get('.sidebar .row p').contains('Your information allows us to securely retrieve your credit scores and provide personalized recommendations based on your credit profile. For the best results, avoid nicknames and use full addresses.');
    // Header:
    cy.get('.sidebar .row h2').contains('Information Security');
    //Description:
    cy.get('.sidebar .row ul li').contains(siteName+' uses 256-bit encryption to secure the transmission of information to our site.');
    cy.get('.sidebar .row ul li').contains('We do not share your personal information with unaffiliated third parties for their own marketing purposes.');

});
