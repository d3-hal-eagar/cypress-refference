/* global cy, Cypress, then, when, given */
/// <reference types="Cypress" />

const flow = 'ck/';

When(`I focus on the Email Address field`, () => {
    cy.get('input[formcontrolname="email"]').click();

});

When(`I focus on the Create Password field`, () => {
    cy.get('input[formcontrolname="password"]').click();
});

Then(`The Email Address input field is focused`, () => {
    cy.focused().should('have.attr', 'formcontrolname', 'email');
    // the test browser does not show the focused highlight correctly though this is known to work,
    // but that appears to be becasue the browser itself does not have focus.
});

Then(`The Password input field is focused`, () => {
    cy.focused().should('have.attr', 'formcontrolname', 'password');
});

When(/^I have enter valid email address "(.*?)"/, (userInput) => {
    cy.get('input[formcontrolname="email"]').type(userInput);
});

When(/^I have enter invalid email address "(.*?)" that "(.*?)"$/, (userInput, typeOfValidationFailure) => {
    cy.get('input[formcontrolname="email"]').type(userInput);
});

When(/^I have enter valid password "(.*?)"$/, (userInput) => {
    cy.get('input[formcontrolname="password"]').type(userInput);
});

When(/^I have enter invalid password "(.*?)" that "(.*?)"$/, (userInput, typeOfValidationFailure) => {
    cy.get('input[formcontrolname="password"]').type(userInput);
});


Then(`Email Address field label is displayed in red`, function () {
    cy.get('input[formcontrolname="email"]').closest('.form-group').find('label.text-danger').should('be.visible');
    cy.get('input[formcontrolname="email"]').closest('.form-group').find('label').should('have.css', 'color', 'rgb(220, 53, 69)');
    //cy.get('label[for="email"]').should('have.css', 'color', 'rgb(220, 53, 69)');//#dc3545
});

Then(`Create Password field displays X Icon`, function () {
    cy.get('input[formcontrolname="password"]').closest('.form-group').find('label i.oi-circle-x').should('be.visible');
    // green check oi-circle-check
    // red x oi-circle-x
});

Then(`Create Password field label is displayed in red`, function () {
    cy.get('input[formcontrolname="password"]').closest('.form-group').find('label.text-danger').should('be.visible');
    cy.get('input[formcontrolname="password"]').closest('.form-group').find('label').should('have.css', 'color', 'rgb(220, 53, 69)');

});


Then(`get email tooltip`, function () {
    // cy.get('input[formcontrolname="email"]').closest('[for="email"]').closest('Email Address');
    cy.get('input[formcontrolname="email"]').closest('.popover').contains('Your email address will be used to log into your account.');
});

Then(`I shall be guided to Step 2 screen`, function () {
    cy.location().should((loc) => {
        expect(loc.pathname).to.eq('/ck/info')
    });
    cy.get('.credit-form-page').should('be.visible');
});

