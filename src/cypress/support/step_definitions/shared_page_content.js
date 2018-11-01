/* global cy, Cypress, then, when, given, Then, When, Given  */
/// <reference types="Cypress" />
(function() {
    "use strict";

    Then(/^I am displayed "(.*?)" Hyperlinked to "(.*?)"$/, (linkText, linkUrl) => {
        cy.get('footer a[href="'+linkUrl+'"]').contains(linkText);
    });

    Then(/^"(.*?)" with text "(.*?)" Hyperlinked to "(.*?)"$/, (dataTest, linkText, linkUrl) => {
        cy.getElement(dataTest).contains(linkText).should('have.attr', 'href', linkUrl).and('be.visible');

    });

    Then(/^"(.*?)" is Hyperlinked to "(.*?)"$/, (dataTest, linkUrl) => {
        cy.getElement(dataTest).should('have.attr', 'href', linkUrl).and('be.visible');

    });

    Then(/^"(.*?)" Hyperlink includes "(.*?)"$/, (dataTest, linkUrl) => {
        //cy.getElement(dataTest).should('have.attr', 'href').and('include', linkUrl).and('be.visible');
        // this is way over complicated but cypress barfed on the url parameters so we work around it
        cy.getElement(dataTest).should('have.attr', 'href').then((href) => {
           cy.wrap(href).should('contain',linkUrl);
        });
    });

    Then(/^"(.*?)" Hyperlink includes siteDomain$/, (dataTest) => {
        cy.get('@_flow_specific').then((flow_specific) => {
            cy.getElement(dataTest).should('have.attr', 'href').then((href) => {
                cy.wrap(href).should('contain',flow_specific.siteDomain);
            });
        });
    });

    Then(/^The "(.*?)" element shall not be hyperlinked$/, (dataTest) => {
        cy.getElement(dataTest).should('be.visible').and('not.have.attr', 'href');
        cy.getChildElement('<a',dataTest).should('not.be.visible');
    });

    Then(/^The "(.*?)" element shall not be hyperlinked desktop page only$/, (dataTest) => {
       if (Cypress.env('TESTMODE') !== 'mobile') {
           cy.getElement(dataTest).should('be.visible').and('not.have.attr', 'href');
           cy.getChildElement('<a',dataTest).should('not.be.visible');
        }
    });

    Then(/^The "(.*?)" element shall not be hyperlinked mobile page only$/, (dataTest) => {
        if (Cypress.env('TESTMODE') === 'mobile') {
            cy.getElement(dataTest).should('be.visible').and('not.have.attr', 'href');
            cy.getChildElement('<a',dataTest).should('not.be.visible');
        }
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
            cy.log('siteName',providedSiteName);
            cy.fixture(flowname+'_matrix.json').as('matrixJSON');
            cy.server();           // enable response stubbing
            cy.route({
                method: 'GET',      // Route all GET requests
                url: '/api/v1/matrix/*',    // that have a URL that matches
                response: '@matrixJSON'        // and force the response to be:
            }).as('matrixCall');
    });

    Given(/^the siteName is "(.*?)"$/, (providedSiteName) => {
        cy.get('@_flow_specific').then((flow_specific) => {
            flow_specific.siteName = providedSiteName;
            cy.log('siteName',flow_specific.siteName);
        });
    });

    Given(/^the siteDomain is "(.*?)"$/, (providedSiteDomain) => {
        cy.get('@_flow_specific').then((flow_specific) => {
            flow_specific.siteDomain = providedSiteDomain;
            cy.log('siteName',flow_specific.siteDomain);
        });
    });

    Then(/^The "(.*?)" message contains siteDomain/, function (element) {
        cy.get('@_flow_specific').then((flow_specific) => {
            cy.getElement(element).should('contain', flow_specific.siteDomain);
        });
    });

    Then(/^The "(.*?)" message contains siteName$/, function (element) {
        cy.get('@_flow_specific').then((flow_specific) => {
            cy.getElement(element).should('contain', flow_specific.siteName);
        });
    });

    Then(`I am displayed Copyright - © 2018 siteName. All Rights Reserved in the footer`, () => {
        cy.get('@_flow_specific').then((flow_specific) => {
            cy.getElement('copyright-text').should('be.visible');
            cy.get('footer').contains('© 2018 '+flow_specific.siteName+'. All Rights Reserved');
        });
    });


Then(`I am displayed siteName in the header`, () => {
    cy.get('@_flow_specific').then((flow_specific) => {
        cy.get('.navbar [data-test="site-link"]').should('contain', flow_specific.siteName);
    });
});

Then(`I am displayed flow Logo`, () => {
        cy.get('@_flow_specific').then((flow_specific) => {
            //cy.get('.navbar [data-test="site-link"] img').should('have.attr','alt').and('contain', flow_specific.siteName);
            cy.get('.navbar img').should('have.attr','alt').and('contain', flow_specific.siteName);
        });
    });

})();
