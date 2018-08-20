/* global cy, Cypress, then, when, given */
/// <reference types="Cypress" />

const flow = 'ck/';
const errorRed = 'rgb(220, 53, 69)';
const textBlack = 'rgb(73, 80, 87)';
const textDark = 'rgb(90, 92, 94)';

Then(/^"(.*?)" field label is displayed in red$/, function (formField) {
    cy.getFormGroup(formField).find('label.text-danger').should('be.visible');
    cy.getFormGroup(formField).find('label').should('have.css', 'color', errorRed);
});

Then(/^"(.*?)" field label is displayed in black/, function (formField) {
    cy.getFormGroup(formField).find('label').should('have.css', 'color', textDark);
    //rgb(90, 92, 94) #5a5c5e
    //rgb(64, 66, 69) #404245
    //rgb(73, 80, 87) #495057
});

Then(/^"(.*?)" field input is displayed in black$/, function (formField) {
    cy.getFormGroup(formField).find('input').should('have.css', 'color', textBlack);
    //rgb(90, 92, 94) #5a5c5e
    //rgb(64, 66, 69) #404245
    //rgb(73, 80, 87) #495057
});

Then(/^"(.*?)" field input is displayed in red$/, function (formField) {
    cy.getFormGroup(formField).find('input.text-danger').should('be.visible');
    cy.getFormGroup(formField).find('input').should('have.css', 'color', errorRed);
});

Then(/^"(.*?)" field select is displayed in red$/, function (formField) {
    cy.getFormGroup(formField).find('select.text-danger').should('be.visible');
    cy.getFormGroup(formField).find('select').should('have.css', 'color', errorRed);
});

Then(/^"(.*?)" field placeholder is displayed in red$/, function (formField) {
    cy.getFormGroup(formField).find('label.text-danger').should('be.visible');
    cy.getFormGroup(formField).find('select').should('have.css', 'color', errorRed);
});

Then(/^"(.*?)" field displays X Icon$/, function (formField) {
    cy.getFormGroup(formField).find('i.oi-circle-x').should('be.visible');
    //cy.getFormGroup(formField).find('label i.oi-circle-x').should('be.visible');
    // green check oi-circle-check
    // red x oi-circle-x
});

Then(/^"(.*?)" field displays check Icon$/, function (formField) {
    cy.getFormGroup(formField).find('i.oi-circle-check').should('be.visible');
    // green check oi-circle-check
    // red x oi-circle-x
});

Then(/^"(.*?)" field does not display X Icon$/, function (formField) {
    cy.getFormGroup(formField).find('i.oi-circle-x').should('not.be.visible');
    // green check oi-circle-check
    // red x oi-circle-x
});

Then(/^I click the X Icon on the "(.*?)" field$/, function (formField) {
    cy.getFormGroup(formField).find('i.oi-circle-x').click();
    cy.wait(200);
    // green check oi-circle-check
    // red x oi-circle-x
});
