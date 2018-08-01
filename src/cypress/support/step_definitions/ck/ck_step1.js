/* global cy, Cypress, then, when, given */
/// <reference types="Cypress" />

const flow = 'ck/';

Then(/^"(.*?)" field label is displayed in red$/, function (formField) {
    cy.getFormGroup(formField).find('label.text-danger').should('be.visible');
    cy.getFormGroup(formField).find('label').should('have.css', 'color', 'rgb(220, 53, 69)');
});

Then(/^"(.*?)" field label is displayed in black/, function (formField) {
    cy.getFormGroup(formField).find('label.text-danger').should('not.be.visible');
    cy.getFormGroup(formField).find('label').should('have.css', 'color', 'rgb(90, 92, 94)');
    //cy.get('label[for="email"]').should('have.css', 'color', 'rgb(90, 92, 94)');//#5a5c5e
});

Then(/^"(.*?)" field displays X Icon$/, function (formField) {
    cy.getFormGroup(formField).find('label i.oi-circle-x').should('be.visible');
    // green check oi-circle-check
    // red x oi-circle-x
});

Then(/^"(.*?)" field displays check Icon$/, function (formField) {
    cy.getFormGroup(formField).find('label i.oi-circle-check').should('be.visible');
    // green check oi-circle-check
    // red x oi-circle-x
});

Then(/^"(.*?)" field does not display X Icon$/, function (formField) {
    cy.getFormGroup(formField).find('label i.oi-circle-x').should('not.be.visible');
    // green check oi-circle-check
    // red x oi-circle-x
});

Then(/^I click the X Icon on the "(.*?)" field$/, function (formField) {
    cy.getFormGroup(formField).find('label i.oi-circle-x').click();
    cy.wait(200);
    // green check oi-circle-check
    // red x oi-circle-x
});

Then(`I shall be guided to Step 2 screen`, function () {
    cy.location().should((loc) => {
        expect(loc.pathname).to.eq('/ck/info')
    });
    cy.get('.credit-form-page').should('be.visible');
});
