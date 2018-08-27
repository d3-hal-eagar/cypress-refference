/* global cy, Cypress, then, when, given */
/// <reference types="Cypress" />

const errorRed = 'rgb(220, 53, 69)';
const textBlack = 'rgb(73, 80, 87)';
const textDark = 'rgb(90, 92, 94)';

Then(/^"(.*?)" field label is displayed in red$/, function (formField) {
    if (formField = 'ssn-label'){
        cy.get('label.form-row-label.text-danger').should('be.visible');
        cy.getElement(formField).should('have.css', 'color', errorRed);
    }
    else {
        cy.getFormGroup(formField).find('label.text-danger').should('be.visible');
        cy.getFormGroup(formField).find('label').should('have.css', 'color', errorRed);
    }
});

Then(/^"(.*?)" field label is displayed in black/, function (formField) {
    if (formField.startsWith("ssn") || formField.startsWith("dob")){
        // e.g. ssn-label, dob-label
        cy.get('label[data-test='+formField+'-label]').should('have.css', 'color', textDark);
    } else {
        cy.getFormGroup(formField).find('label').should('have.css', 'color', textDark);
    }
});

Then(/^"(.*?)" field input is displayed in black$/, function (formField) {
    cy.getFormGroup(formField).find('input').should('have.css', 'color', textBlack);
});

Then(/^"(.*?)" input field is displayed in red$/, function (formField) {
    cy.getFormGroup(formField).find('input.text-danger').should('be.visible');
    cy.getFormGroup(formField).find('input').should('have.css', 'color', errorRed);
});

Then(/^"(.*?)" field displays X Icon$/, function (formField) {
    cy.getFormGroup(formField).find('i.oi-circle-x').should('be.visible');
});

Then(/^"(.*?)" field does not display X Icon$/, function (formField) {
    cy.getFormGroup(formField).find('i.oi-circle-x').should('not.be.visible');
});

Then(/^I click the X Icon on the "(.*?)" field$/, function (formField) {
    cy.wait(200);
    cy.getFormGroup(formField).find('i.oi-circle-x').click();
    cy.wait(200);
});

Then(/^I click the label on the "(.*?)" field$/, function (formField) {
    cy.wait(200);
    cy.getFormGroup(formField).find('label').click();
    cy.wait(200);
});

Then(/^"(.*?)" select field shall be red/, function (formField) {
    cy.getFormGroup(formField).find('select').should('have.css', 'color', textRed);
});

Then(/^"(.*?)" select field is displayed in red$/, function (formField) {
    cy.getFormGroup(formField).find('select.text-danger').should('be.visible');
    cy.getFormGroup(formField).find('select').should('have.css', 'color', errorRed);
});


Then(/^"(.*?)" select field is displayed in black$/, function (formField) {
    cy.getFormGroup(formField).find('select').should('have.css', 'color', textBlack);
    //rgb(90, 92, 94) #5a5c5e
    //rgb(64, 66, 69) #404245
    //rgb(73, 80, 87) #495057
});
