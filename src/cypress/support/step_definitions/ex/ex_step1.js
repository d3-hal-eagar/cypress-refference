/* global cy, Cypress, then, when, given, Then, When, Given  */
/// <reference types="Cypress" />
(function() {
    "use strict";

    Then(/^"(.*?)" input field shall be black$/, function (formField) {
        cy.get('@_flow_specific').then((flow_specific) => {
            cy.getFormGroup(formField).find('input').should('have.css', 'color', flow_specific.textBlack);
        });
    });

    Then(/^"(.*?)" input field shall be outlined in gray/, function (formField) {
        cy.get('@_flow_specific').then((flow_specific) => {
            cy.getFormGroup(formField).find('input').should('have.css', 'border-color', flow_specific.defaultBorder);
        });
    });

    Then(/^"(.*?)" input field shall be outlined in green/, function (formField) {
        cy.get('@_flow_specific').then((flow_specific) => {
            cy.getFormGroup(formField).find('input').should('have.css', 'border-color', flow_specific.validGreen);
        });
    });

    Then(/^"(.*?)" input field shall be outlined in red$/, function (formField) {
        cy.get('@_flow_specific').then((flow_specific) => {
            cy.getFormGroup(formField).find('input').should('have.css', 'border-color', flow_specific.errorRedBorder);
        });
    });

    Then(/^"(.*?)" field displays warning Icon$/, function (formField) {
        cy.get('@_flow_specific').then((flow_specific) => {
            cy.getFormGroup(formField).find('i.oi.oi-warning')
                .should('be.visible')
                .and('have.css', 'color', flow_specific.errorRedBorder);
        });
    });

    Then(/^"(.*?)" field displays green colored check mark Icon$/, function (formField) {
        cy.get('@_flow_specific').then((flow_specific) => {
            cy.getFormGroup(formField).find('i.oi.oi-circle-check')
                .should('be.visible')
                .and('have.css', 'color', flow_specific.checkMarkGreen);
        });
    });

    Then(/^"(.*?)" field does not display warning Icon$/, function (formField) {
        cy.getFormGroup(formField).find('i.oi.oi-warning').should('not.be.visible');
    });
})();
