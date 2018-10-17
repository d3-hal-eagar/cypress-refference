/* global cy, Cypress, then, when, given, Then, When, Given  */
/// <reference types="Cypress" />
(function() {
    "use strict";

    Then(`I am displayed flow Terms of Service Text`, () => {
        //cy.getElement('section-title').contains('Terms of Use');
        cy.getElement('<h3>').contains('TERMS OF USE');
        cy.get('body').contains('BY USING THE WEBSITE AND THE SERVICES AND/OR REQUESTING THAT WE CONTACT YOU ABOUT OUR SERVICES,');
        cy.get('body').contains('The following additional terms apply to any software (including any updates or upgrades to the software and any related documentation) that we make available to you from time to time for your use in connection with the Website and Services');
        cy.get('body').contains('INFORMATIONAL PURPOSES; NO PROFESSIONAL ADVICE');
        cy.get('body').contains('SERVICES');
        cy.get('body').contains('REGISTRATION');
        cy.get('body').contains('NFORMATION AUTHORIZATION');
        cy.get('body').contains('FCRA DISCLOSURES');
        cy.get('body').contains('TRIAL PERIODS');
        cy.get('body').contains('SUBSCRIPTIONS; BILLING');
        cy.get('body').contains('CANCELLATION; TERMINATION; REFUND POLICY');
        cy.get('body').contains('ELECTRONIC COMMUNICATIONS');
        cy.get('body').contains('MEMBER BENEFITS');
        cy.get('body').contains('WEBSITE LICENSE');
        cy.get('body').contains('OWNERSHIP');
        cy.get('body').contains('USER CONTENT LICENSE');
        cy.get('body').contains('ENDORSEMENTS');
        cy.get('body').contains('DIGITAL MILLENNIUM COPYRIGHT ACT ("DMCA") NOTICE');
        cy.get('body').contains('SOFTWARE TERMS');
    });

    Then(/^I am displayed flow Privacy Policy Text$/, () => {
        //cy.getElement('section-title').contains('Privacy Policy');
        cy.getElement('<h2>').contains('PRIVACY POLICY');
        //cy.get('body').contains('We Are Committed to Safeguarding Customer Information');
        cy.get('body').contains('WE ARE COMMITTED TO SAFEGUARDING CUSTOMER INFORMATION');
        cy.get('body').contains('THE INFORMATION WE GATHER');
        cy.get('body').contains('INFORMATION SHARING');
        cy.get('body').contains('LINKS TO OUTSIDE THIRD PARTIES');
        cy.get('body').contains('CHILDREN\'S GUIDELINES');
        cy.get('body').contains('PUBLIC FORUMS');
        cy.get('body').contains('CONSENT TO INTERNATIONAL INFORMATION TRANSFERS');
        cy.get('body').contains('SECURITY');
        cy.get('body').contains('CHANGES TO THIS PRIVACY POLICY');
        cy.get('body').contains('MAKING CHANGES TO YOUR PERSONAL INFORMATION');
        cy.get('body').contains('CHANGES TO THIS PRIVACY POLICY');
        cy.get('body').contains('TERMS OF USE');
        cy.get('body').contains('We reserve the right to change, modify add or remove portions of this Privacy Policy at any time and without prior notice.');
        //cy.get('body').contains('Should you have any questions about Privacy, please contact:');
    });

    Then(`I am displayed the correct blocks on the ck Step 1 right rail`, () => {
        //cy.get('@_flow_specific').then((flow_specific) => {
            //D3F-217
            cy.get('.sidebar').should('be.visible');
        //     // Header:
        //     cy.get('.sidebar [data-test=score-sidebar-section] h2').contains('A Truly Free Credit Score');
        //     //Description:
        //     cy.get('.sidebar [data-test=score-sidebar-section] p').contains(flow_specific.siteName+' is free, forever. We will never ask you for your credit card or payment information.');
        //     // Header:
        //     cy.get('.sidebar [data-test=credit-sidebar-section] h2').contains('Will This Affect My Credit?');
        //     //Description:
        //     cy.get('.sidebar [data-test=credit-sidebar-section] p').contains('Absolutely not! Checking your score on '+flow_specific.siteName+' is a soft inquiry, which will never affect your credit.');
            // Header:
            cy.get('.sidebar [data-test=score-sidebar-section] h2').contains('No Credit Card Required');
            //Description:
            cy.get('.sidebar [data-test=score-sidebar-section] p').contains('Can I really get my score & report free? Absolutely! There is no Credit Card Required!');
            // Header:
            cy.get('.sidebar [data-test=credit-sidebar-section] h2').contains('It never hurts to check.');
            //Description:
            cy.get('.sidebar [data-test=credit-sidebar-section] p').contains('Check your credit report as often as you want, it won’t affect your score.');

        //});
    });

    Then(`I am displayed the correct blocks on the ck Step 2 right rail`, () => {
        cy.get('@_flow_specific').then((flow_specific) => {
            //D3F-218
            cy.get('.sidebar').should('be.visible');
            // Header:
            cy.get('.sidebar .row h2').contains('Why Do You Need My Information?');
            //Description:
            cy.get('.sidebar .row p').contains('Your information allows us to securely retrieve your credit scores and provide personalized recommendations based on your credit profile. For the best results, avoid nicknames and use full addresses.');
            // Header:
            cy.get('.sidebar .row h2').contains('Information Security');
            //Description:
            cy.get('.sidebar .row ul li').contains(flow_specific.siteName+' uses 256-bit encryption to secure the transmission of information to our site.');
            cy.get('.sidebar .row ul li').contains('We do not share your personal information with unaffiliated third parties for their own marketing purposes.');
        });
    });

    Then(`I will be displayed a preloading screen`, () => {
        cy.getElement('modal-body').should('be.visible');
        cy.getElement('modal-body').find('.fa-spinner').should('be.visible');
        cy.getElement('modal-body').find('h2').contains('Please wait, Updating your credit information.');
        cy.getElement('modal-body').find('p').contains('Loading your information...');

    });
})();
