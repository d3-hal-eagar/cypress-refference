/* global cy, Cypress, then, when, given */
/// <reference types="Cypress" />

Then(`I am displayed the following on the 'Hero Image' block`, () => {
    // Logo on the top left corner
    cy.getElement('site-link').should('be.visible');
    // Background Hero Image
    cy.getElement('header-message').should('be.visible');
    // Header: Your Credit score should be free. And now it is.
    cy.getChildElement('header-message', 'section-title').contains('Your credit score should be free. And now it is.');
    // Sub-Header: Check your score anytime. No credit card required.
    cy.getElement('header-message').find('h2').contains('Check your score anytime.');
    cy.getElement('header-message').find('h2').contains('No Credit Card Required.');
    // See My Score: Call-to-action button that will take me to the step 1 of the acquisition flow.
    cy.getChildElement('header-message', 'header-signup-button').contains('See my score').click();
    cy.url().should('include', '/ck/signUp')
});

Then(`I am displayed the following on the 'Free Credit Score is just the beginning.' block`, () => {
    // Image on the right side of the block
    cy.getElement('free-credit-score-section').should('be.visible');
    // Header: Free Credit Score is just the beginning.
    cy.getElement('free-credit-score-section').find('h3').contains('A free credit score is just the beginning');
    // Sub-Header: As a member, you can see your accounts, your last reported balances and negative items that may be affecting your credit score.
    cy.getElement('free-credit-score-section').contains('As a member, you can see your accounts, your last reported balances and negative items that may be affecting your credit score.');
    cy.getElement('free-credit-score-section').find('img').should('be.visible');
});

Then(`I am displayed the following on the 'More than a Score' block`, () => {
    // Block Header: More than a Score
    cy.getElement('more-than-section').find('.section-title').contains('More than a Score');

// Section 1 -
    // Image on the right side of the block
    cy.getElement('new-accounts-section').find('img').should('be.visible');
    // Number 1 Icon
    cy.getElement('new-accounts-section').find('.circle-number').contains('1');
    // Header: See New Accounts
    cy.getElement('new-accounts-section').find('h3').contains('See New Accounts');
    // Sub-Header: "See when new accounts are added to your credit profile by logging into your account."
    cy.getElement('new-accounts-section').contains('See when new accounts are added to your credit profile by logging into your account.');

// Section 2 -
    // Image on the right side of the block
    cy.getElement('insights-section').find('img').should('be.visible');
    // Number 2 Icon
    cy.getElement('insights-section').find('.circle-number').contains('2');
    // Header: Insights
    cy.getElement('insights-section').find('h3').contains('Insights');
    // Sub-Header: "See what happens to your score when a new account is opened, or a late payment is added."
    cy.getElement('insights-section').contains('See what happens to your score when a new account is opened, or a late payment is added.');

// Section 3 -
    // Image on the right side of the block
    cy.getElement('decisions-section').find('img').should('be.visible');
    // Number 3 Icon
    cy.getElement('decisions-section').find('.circle-number').contains('3');
    // Header: Better Decisions
    cy.getElement('decisions-section').find('h3').contains('Better Decisions');
    // Sub-Header: "See what happens to your score when a new account is opened, or a late payment is added."
    cy.getElement('decisions-section').contains('See what happens to your score when a new account is opened, or a late payment is added.');
});

Then(`I am displayed the following on the 'No Credit Card Required' block`, () => {
    // Block Header - No Credit Card Required
    cy.getElement('no-credit-card-section').find('.section-title').contains('No Credit Card Required');
    // Image on the left side of the block
    cy.getElement('free-report-section').find('img').should('be.visible');
    // Header: "Can I really get my score & report free??"
    cy.getElement('free-report-section').find('h3').contains('Can I really get my score & report free?');
    // Sub-Header: "Absolutely! There is no Credit Card Required!"
    cy.getElement('free-report-section').contains('Absolutely! There is no Credit Card Required!');
    // Call-to-action Button - Let's do it*. This will land the user on 1step of acquisition flow.
    cy.getElement('free-report-section').find('.cta-button').contains('Let’s do it').click();
    cy.url().should('include', '/ck/signUp')
});

Then(`I am displayed the following on the 'We treat your data as if it was our own.' block`, () => {
// This block has 2 sections - Security and Privacy and contains the following.
//     Block Header - "We treat your data as if it was our own
    cy.getElement('data-section').find('.section-title').contains('We treat your data as if it was our own');
// Section 1 - Security
// Image
    cy.getElement('security-section').find('img').should('be.visible');
// Header: Security
    cy.getElement('security-section').find('h3').contains('Security');
// Sub-Header: "We use 128-bit encryption to protect the transmission of your data to our site."
    cy.getElement('security-section').contains('Security');
// Section 2 - Privacy
// Image
    cy.getElement('privacy-section').find('img').should('be.visible');
// Header: Privacy
    cy.getElement('privacy-section').find('h3').contains('Privacy');
// Sub-Header: "We do not share your personal information with unaffiliated third parties for their own marketing purposes."
    cy.getElement('privacy-section').contains('We do not share your personal information with unaffiliated third parties for their own marketing purposes.');
});

Then(`I am displayed the following on the 'It never hurts to check.' block`, () => {
    // Background image
    cy.getElement('landing-footer-section').should('be.visible');

    // Header: It never hurts to check
    cy.getElement('landing-footer-section').find('h1').contains('It never hurts to check');
    // Sub-Header: Check your credit reports as often as you want, it won't affect your score.
    cy.getElement('landing-footer-section').find('p').contains('Check your credit reports as often as you want, it won\'t affect your score.');
    // Call-to-action Button - Show my score . This will land the user on Step1 of acquisition flow.
    cy.getElement('landing-footer-section').find('.cta-button').contains('Show my score').click();
    cy.url().should('include', '/ck/signUp')
});
