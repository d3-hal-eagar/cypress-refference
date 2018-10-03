/* global cy, Cypress, then, when, given, Then, When, Given  */
/// <reference types="Cypress" />
(function() {
    "use strict";

    const CK_errorRed = 'rgb(220, 53, 69)';
    const CK_textBlack = 'rgb(73, 80, 87)';
    const CK_textDark = 'rgb(90, 92, 94)';

    Then(/^"(.*?)" field label is displayed in red$/, function (formField) {
        // e.g. ssn-label, dob-label
        if (formField.endsWith("-label")){
            cy.get('label[data-test='+formField+'].text-danger').should('be.visible');
            cy.getElement(formField).should('have.css', 'color', CK_errorRed);
        }
        else {
            cy.getFormGroup(formField).find('label.text-danger').should('be.visible');
            cy.getFormGroup(formField).find('label').should('have.css', 'color', CK_errorRed);
        }
    });

    Then(/^"(.*?)" field label is displayed in black/, function (formField) {
        if (formField.startsWith("ssn") || formField.startsWith("dob")){
            // e.g. ssn-label, dob-label
            cy.get('label[data-test='+formField+'-label]').should('have.css', 'color', CK_textDark);
        } else {
            cy.getFormGroup(formField).find('label').should('have.css', 'color', CK_textDark);
        }
    });

    Then(/^"(.*?)" field input is displayed in black$/, function (formField) {
        cy.getFormGroup(formField).find('input').should('have.css', 'color', CK_textBlack);
    });

    Then(/^"(.*?)" input field is displayed in red$/, function (formField) {
        cy.getFormGroup(formField).find('input.text-danger').should('be.visible');
        cy.getFormGroup(formField).find('input').should('have.css', 'color', CK_errorRed);
    });

    Then(/^"(.*?)" field displays X Icon$/, function (formField) {
        cy.getElement(formField).focus().blur().getFormGroup(formField).find('i.oi-circle-x').should('be.visible');
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
        cy.getFormGroup(formField).find('select').should('have.css', 'color', CK_errorRed);
    });
})();
