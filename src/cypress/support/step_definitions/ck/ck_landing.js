/* global cy, Cypress, then, when, given */
/// <reference types="Cypress" />

const flow = 'ck/';

Then(`I am displayed the following on the 'Hero Image' block`, () => {
    // Logo on the top left corner
    cy.get('.navbar a.navbar-brand').should('be.visible');
    // Background Hero Image
    cy.get('.landing-page .jumbo-content').should('be.visible');
    // Header: Your Credit score should be free. And now it is.
    cy.get('.landing-page .jumbo.header .jumbo-content .jumbo-content-message h1').contains('Your credit score should be free. And now it is.');
    // Sub-Header: Check your score anytime. No credit card required.
    cy.get('.landing-page .jumbo.header .jumbo-content .jumbo-content-message h2').contains('Check your score anytime.');
    cy.get('.landing-page .jumbo.header .jumbo-content .jumbo-content-message h2').contains('No Credit Card Required.');
    // See My Score: Call-to-action button that will take me to the step 1 of the acquisition flow.
    cy.get('.landing-page .jumbo.header .jumbo-content .jumbo-content-message button.cta-button').contains('See my score').click();
    cy.url().should('include', '/ck/signUp')
});

Then(`I am displayed the following on the 'Free Credit Score is just the beginning.' block`, () => {
    // Image on the right side of the block
    cy.get('.landing-page .info-blocks .row:nth-of-type(1) img').should('be.visible');
    // Header: Free Credit Score is just the beginning.
    cy.get('.landing-page .info-blocks .row:nth-of-type(1) h3').contains('A free credit score is just the beginning');
    // Sub-Header: As a member, you can see your accounts, your last reported balances and negative items that may be affecting your credit score.
    cy.get('.landing-page .info-blocks .row:nth-of-type(1)').contains('As a member, you can see your accounts, your last reported balances and negative items that may be affecting your credit score.');
});

Then(`I am displayed the following on the 'More than a Score' block`, () => {
    // Block Header: More than a Score
    cy.get('.landing-page .info-blocks .row:nth-of-type(2)').contains('More than a score');

// Section 1 -
    // Image on the right side of the block
    cy.get('.landing-page .info-blocks .row:nth-of-type(3) img').should('be.visible');
    // Number 1 Icon
    cy.get('.landing-page .info-blocks .row:nth-of-type(3) .circle-number').contains('1');
    // Header: See New Accounts
    cy.get('.landing-page .info-blocks .row:nth-of-type(3) h3').contains('See New Accounts');
    // Sub-Header: "See when new accounts are added to your credit profile by logging into your account."
    cy.get('.landing-page .info-blocks .row:nth-of-type(3)').contains('See New Accounts');

// Section 2 -
    // Image on the right side of the block
    cy.get('.landing-page .info-blocks .row:nth-of-type(3) img').should('be.visible');
    // Number 2 Icon
    cy.get('.landing-page .info-blocks .row:nth-of-type(4) .circle-number').contains('2');
    // Header: Insights
    cy.get('.landing-page .info-blocks .row:nth-of-type(4) h3').contains('Insights');
    // Sub-Header: "See what happens to your score when a new account is opened, or a late payment is added."
    cy.get('.landing-page .info-blocks .row:nth-of-type(4)').contains('See what happens to your score when a new account is opened, or a late payment is added.');

// Section 3 -
    // Image on the right side of the block
    cy.get('.landing-page .info-blocks .row:nth-of-type(3) img').should('be.visible');
    // Number 3 Icon
    cy.get('.landing-page .info-blocks .row:nth-of-type(5) .circle-number').contains('3');
    // Header: Better Decisions
    cy.get('.landing-page .info-blocks .row:nth-of-type(5) h3').contains('Better Decisions');
    // Sub-Header: "See what happens to your score when a new account is opened, or a late payment is added."
    cy.get('.landing-page .info-blocks .row:nth-of-type(5)').contains('See what happens to your score when a new account is opened, or a late payment is added.');
});

Then(`I am displayed the following on the 'No Credit Card Required' block`, () => {
    // Block Header - No Credit Card Required
    cy.get('.landing-page .info-blocks .row:nth-of-type(6)').contains('No Credit Card Required');
    // Image on the left side of the block
    cy.get('.landing-page .info-blocks .row:nth-of-type(7) img').should('be.visible');
    // Header: "Can I really get my score & report free??"
    cy.get('.landing-page .info-blocks .row:nth-of-type(7) h3').contains('Can I really get my score & report free?');
    // Sub-Header: "Absolutely! There is no Credit Card Required!"
    cy.get('.landing-page .info-blocks .row:nth-of-type(7)').contains('Absolutely! There is no Credit Card Required!');
    // Call-to-action Button - Let's do it*. This will land the user on 1step of acquisition flow.
    cy.get('.landing-page .info-blocks .row:nth-of-type(7) button.cta-button').contains('Let’s do it').click();
    cy.url().should('include', '/ck/signUp')
});

Then(`I am displayed the following on the 'We treat your data as if it was our own.' block`, () => {
// This block has 2 sections - Security and Privacy and contains the following.
//     Block Header - "We treat your data as if it was our own
    cy.get('.landing-page .info-blocks .row:nth-of-type(8)').contains('We treat your data as if it was our own');
// Section 1 - Security
// Image
    cy.get('.landing-page .info-blocks .row:nth-of-type(9)').find('img').should('have.length', 2);
// Header: Security
    cy.get('.landing-page .info-blocks .row:nth-of-type(9) h3').contains('Security');
// Sub-Header: "We use 128-bit encryption to protect the transmission of your data to our site."
    cy.get('.landing-page .info-blocks .row:nth-of-type(9)').contains('Security');
// Section 2 - Privacy
// Image
// Header: Privacy
    cy.get('.landing-page .info-blocks .row:nth-of-type(9) h3').contains('Privacy');
// Sub-Header: "We do not share your personal information with unaffiliated third parties for their own marketing purposes."
    cy.get('.landing-page .info-blocks .row:nth-of-type(9)').contains('We do not share your personal information with unaffiliated third parties for their own marketing purposes.');
});

Then(`I am displayed the following on the 'It never hurts to check.' block`, () => {
    // Background image
    cy.get('.landing-page .jumbo-content');

    // Header: It never hurts to check
    cy.get('.landing-page .landing-footer .jumbo-content .jumbo-content-message h1').contains('It never hurts to check');
    // Sub-Header: Check your credit reports as often as you want, it won't affect your score.
    cy.get('.landing-page .landing-footer .jumbo-content .jumbo-content-message p').contains('Check your credit reports as often as you want, it won\'t affect your score.');
    // Call-to-action Button - Show my score . This will land the user on Step1 of acquisition flow.
    cy.get('.landing-page .landing-footer .jumbo-content .jumbo-content-message button.cta-button').contains('Show my score').click();
    cy.url().should('include', '/ck/signUp')
});
