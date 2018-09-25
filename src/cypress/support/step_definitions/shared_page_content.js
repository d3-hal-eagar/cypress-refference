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

Given(/^We make siteName "(.*?)" and flow is "(.*?)"$/, (providedSiteName, flowname) => {
    //flow does not exist yet
    //cy.get('@flow').then((flow) => {
        //flow.siteName = providedSiteName;
        cy.log('siteName',providedSiteName);
        cy.fixture(flowname+'_matrix.json').as('matrixJSON');
        cy.server();           // enable response stubbing
        cy.route({
            method: 'GET',      // Route all GET requests
            url: '/api/v1/matrix/*/*',    // that have a URL that matches
            response: '@matrixJSON'        // and force the response to be:
        }).as('matrixCall');
        //cy.wait(['@matrixCall']);
    //});
});

Given(/^the siteName is "(.*?)"$/, (providedSiteName) => {
    cy.get('@flow').then((flow) => {
        flow.siteName = providedSiteName;
        cy.log('siteName',flow.siteName);
    });
});

Then(/^The "(.*?)" message contains siteName$/, function (element) {
    cy.get('@flow').then((flow) => {
        cy.getElement(element).should('contain', flow.siteName);
    });
});

Then(`I am displayed Copyright - © 2018 siteName. All Rights Reserved in the footer`, () => {
    cy.get('@flow').then((flow) => {
        cy.getElement('copyright-text').should('be.visible');
        cy.get('footer').contains('© 2018 '+flow.siteName+'. All Rights Reserved');
    });
});


Then(`I am displayed siteName in the header`, () => {
    cy.get('@flow').then((flow) => {
        cy.get('nav.navbar [data-test="site-link"]').should('contain', flow.siteName);
    });
});

Then(`I am displayed flow Logo`, () => {
    cy.get('@flow').then((flow) => {
        cy.get('nav.navbar [data-test="site-link"]').should('contain', flow.siteName);
    });
});
