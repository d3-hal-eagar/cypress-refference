/* global cy, Cypress, then, when, given */
/// <reference types="Cypress" />

Then(/^I am displayed "(.*?)" Hyperlinked to "(.*?)"$/, (linkText, linkUrl) => {
    cy.get('footer a[href="'+linkUrl+'"]').contains(linkText);
});

Then(/^"(.*?)" with text "(.*?)" Hyperlinked to "(.*?)"$/, (dataTest, linkText, linkUrl) => {
    cy.getElement(dataTest).contains(linkText).should('have.attr', 'href', linkUrl).and('be.visible');

});

Then(`I am displayed ck Footer`, () => {
    cy.get('footer').should('be.visible');
    cy.getElement('copyright-text').should('be.visible');
});

Then(/^"(.*?)" Hyperlinked targets opening in a new tab$/, (linkUrl) => {
    cy.get('footer a[href="'+linkUrl+'"][target="_blank"]').should('be.visible');
});

Then(/^"(.*?)" targets opening in a new tab$/, (dataTest) => {
    cy.getElement(dataTest).should('have.attr', 'target', '_blank').and('be.visible');
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
    cy.get('body').contains('The following additional terms apply to any software (including any updates or upgrades to the software and any related documentation) that we make available to you from time to time for your use in connection with the Website and Services (the "Software"):');
});

Then(/^I am displayed ck Privacy Policy Text$/, () => {
    cy.getElement('section-title').contains('Privacy Policy');
    cy.get('body').contains('We Are Committed to Safeguarding Customer Information');
    cy.get('body').contains('Any material changes to our Privacy Practices or security procedures will be posted on this page so that you are always aware of what information we collect and how we use it as well as the latest material changes we make to our security procedures.');
    //cy.get('body').contains('Should you have any questions about Privacy, please contact:');
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
