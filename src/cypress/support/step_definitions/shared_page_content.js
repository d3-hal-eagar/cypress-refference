/* global cy, Cypress, then, when, given */
/// <reference types="Cypress" />

Then(/^I am displayed "(.*?)" Hyperlinked to "(.*?)"$/, (linkText, linkUrl) => {
    cy.get('footer a[href="'+linkUrl+'"]').contains(linkText);
});

Then(/^"(.*?)" with text "(.*?)" Hyperlinked to "(.*?)"$/, (dataTest, linkText, linkUrl) => {
    cy.getElement(dataTest).contains(linkText).should('have.attr', 'href', linkUrl).and('be.visible');

});

Then(`I am displayed flow Footer`, () => {
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

Then(`I am displayed flow Logo`, () => {
    cy.get('nav.navbar [data-test="site-link"]').should('contain', siteName);
});
