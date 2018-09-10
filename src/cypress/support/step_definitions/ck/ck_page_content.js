/* global cy, Cypress, then, when, given */
/// <reference types="Cypress" />

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
    cy.get('@flow').then((flow) => {
        //D3F-217
        cy.get('.sidebar').should('be.visible');
    //     // Header:
    //     cy.get('.sidebar [data-test=score-sidebar-section] h2').contains('A Truly Free Credit Score');
    //     //Description:
    //     cy.get('.sidebar [data-test=score-sidebar-section] p').contains(flow.siteName+' is free, forever. We will never ask you for your credit card or payment information.');
    //     // Header:
    //     cy.get('.sidebar [data-test=credit-sidebar-section] h2').contains('Will This Affect My Credit?');
    //     //Description:
    //     cy.get('.sidebar [data-test=credit-sidebar-section] p').contains('Absolutely not! Checking your score on '+flow.siteName+' is a soft inquiry, which will never affect your credit.');
        // Header:
        cy.get('.sidebar [data-test=score-sidebar-section] h2').contains('No Credit Card Required');
        //Description:
        cy.get('.sidebar [data-test=score-sidebar-section] p').contains('Can I really get my score & report free? Absolutely! There is no Credit Card Required!');
        // Header:
        cy.get('.sidebar [data-test=credit-sidebar-section] h2').contains('It never hurts to check.');
        //Description:
        cy.get('.sidebar [data-test=credit-sidebar-section] p').contains('Check your credit report as often as you want, it won’t affect your score.');

    });
});

Then(`I am displayed the correct blocks on the ck Step 2 right rail`, () => {
    cy.get('@flow').then((flow) => {
        //D3F-218
        cy.get('.sidebar').should('be.visible');
        // Header:
        cy.get('.sidebar .row h2').contains('Why Do You Need My Information?');
        //Description:
        cy.get('.sidebar .row p').contains('Your information allows us to securely retrieve your credit scores and provide personalized recommendations based on your credit profile. For the best results, avoid nicknames and use full addresses.');
        // Header:
        cy.get('.sidebar .row h2').contains('Information Security');
        //Description:
        cy.get('.sidebar .row ul li').contains(flow.siteName+' uses 256-bit encryption to secure the transmission of information to our site.');
        cy.get('.sidebar .row ul li').contains('We do not share your personal information with unaffiliated third parties for their own marketing purposes.');
    });
});

Then(`I will be displayed a preloading screen`, () => {
    cy.getElement('modal-body').should('be.visible');
    cy.getElement('modal-body').find('img').should('be.visible');
    cy.getElement('modal-body').find('h2').contains('Please wait, Updating your credit information.');
    cy.getElement('modal-body').find('p').contains('Loading your information...');

});
