/* global cy, Cypress, then, when, given */
/// <reference types="Cypress" />


Then(`I am displayed the correct blocks on the ex Step 1 right rail`, () => {
    //D3F-381
    cy.get('.col-lg-5').should('be.visible');
    // Header:
    cy.getElement('aside-order').find('h4').contains('When you order today, you’ll get:');
    //Description:
    cy.getElement('aside-order').find('ul li').contains('Free TransUnion Credit Report');
    cy.getElement('aside-order').find('ul li').contains('See The Latest TransUnion Credit Information');
    cy.getElement('aside-order').find('ul li').contains('Stay Up To Date on Changes');
    cy.getElement('aside-order').find('ul li').contains('Act Quickly If Issues Are Found');
    cy.getElement('aside-order').find('ul li').contains('Identify Possible Negative Items');
    // Header:
    cy.getElement('aside-free').find('h4').contains('Completely Free and Easy');
    //Description:
    cy.getElement('aside-free').find('p').contains('No purchase or credit card required. Checking your own credit will NOT hurt your credit scores.');

    // Header:
    cy.getElement('aside-safe').find('h4').contains('Safe and Secure');
    //Description:
    cy.getElement('aside-safe').find('p').contains('The information you provide will be transferred to us through a private secure connection.');
    cy.getElement('aside-secure').find('img').should('be.visible');
});


Then(`I am displayed the correct blocks on the ex Step 2 right rail`, () => {

    cy.get('@flow').then((flow) => {
        //D3F-492
        // Header:
        cy.getElement('aside-order').find('h2').contains('Your Order Summary');
        //Description:
        cy.getElement('aside-order').find('h3').contains(flow.siteName+' Basic $0.00');
        cy.getElement('aside-order').find('li').contains('Free TransUnion Credit Report');
        cy.getElement('aside-order').find('li').contains('See The Latest TransUnion Credit Information');
        cy.getElement('aside-order').find('li').contains('Stay Up To Date on Changes');
        cy.getElement('aside-order').find('li').contains('Act Quickly If Issues Are Found');
        cy.getElement('aside-order').find('li').contains('Identify Possible Negative Items');

        cy.getElement('aside-order-tax').contains('Sales Tax');
        cy.getElement('aside-order-tax').contains('$0.00');
        cy.getElement('aside-order-total').contains('Order Total');
        cy.getElement('aside-order-total').contains('$0.00');
        cy.getElement('aside-order').find('li').contains('* Includes New Inquiries, New Accounts, Public Records, Fraud Alerts and Personal Information updates when added to your '+flow.siteName+' Credit Report');
        // Header:
        cy.getElement('aside-secure').find('h4').contains('Privacy Policy Notice');
        //Description:
        cy.getElement('aside-secure').find('p').contains(flow.siteName + '\'s policy on how your personal information is used and disclosed is contained in our Privacy Policy. This product is Web-based and you agree to accept this notification, revisions, and the provision of an annual notice electronically through this website, if required.');

        //Secure block
        cy.getElement('aside-secure').find('img').should('be.visible');
    });
});

Then(`I am displayed the right rail Order Summary block`, () => {
    cy.get('@flow').then((flow) => {
        cy.get('.col-lg-5 [data-test=aside-order').should('be.visible');
        // Header:
        cy.get('.col-lg-5 [data-test=aside-order] h2').contains('Your Order Summary');
        cy.get('.col-lg-5 [data-test=aside-order] h3').contains('When you order today, you’ll get:');
        cy.get('.col-lg-5 [data-test=aside-order] span').contains('$0.00');
        //Description:
        // cy.get('.col-lg-5 [data-test=aside-order] ul').contains('Free '+flow.siteName+' Credit Report');
        cy.get('.col-lg-5 [data-test=aside-order] ul li').contains('See The Latest TransUnion Credit Information');
        cy.get('.col-lg-5 [data-test=aside-order] ul li').contains('Stay Up To Date on Changes');
        cy.get('.col-lg-5 [data-test=aside-order] ul li').contains('Act Quickly If Issues Are Found');
        cy.get('.col-lg-5 [data-test=aside-order] ul li').contains('Identify Possible Negative Items');
        cy.get('.col-lg-5 [data-test=aside-order-tax]').contains('Sales tax');
        cy.get('.col-lg-5 [data-test=aside-order-tax] span').contains('$0.00');
        cy.get('.col-lg-5 [data-test=aside-order-total]').contains('Order Total');
        cy.get('.col-lg-5 [data-test=aside-order-total] span').contains('$0.00');
        cy.get('.col-lg-5 [data-test=aside-order-note]').contains('Includes New Inquiries, New Accounts, Public Records, Fraud Alerts, and Personal Information updates when added to your TransUnion Credit Report');
        cy.get('.col-lg-5 [data-test=aside-order-note] sup').contains('*');
    });
});

Then(`I am displayed the right rail Secure block`, () => {
    cy.get('.col-lg-5 [data-test=aside-secure] img').should('be.visible');
});

Then(/^I am displayed the correct message in the modal header "(.*?)"$/, (modalText) => {
    cy.get('.modal-header').contains(modalText);
});

Then(`I am displayed the correct message in the modal`, (modalText) => {
    cy.get('.modal-body').contains(modalText);
});

