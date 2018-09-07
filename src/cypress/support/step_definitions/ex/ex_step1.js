/* global cy, Cypress, then, when, given */
/// <reference types="Cypress" />

const EX_errorRedBorder = 'rgb(203, 18, 62)';
const EX_validGreenBorder = 'rgb(37, 145, 94)';
const EX_neutralGray = 'rgb(206, 212, 218)';
const EX_textDark = 'rgb(73, 80, 87)';

Then(/^"(.*?)" input field shall be black$/, function (formField) {
    cy.getFormGroup(formField).find('input').should('have.css', 'color', EX_textDark);
});

Then(/^"(.*?)" input field shall be outlined in gray/, function (formField) {
    cy.getFormGroup(formField).find('input').should('have.css', 'border-color', EX_neutralGray);
});

Then(/^"(.*?)" input field shall be outlined in green/, function (formField) {
    cy.getFormGroup(formField).find('input').should('have.css', 'border-color', EX_validGreenBorder);
});

Then(/^"(.*?)" input field shall be outlined in red$/, function (formField) {
    cy.getFormGroup(formField).find('input').should('have.css', 'border-color', EX_errorRedBorder);
});

Then(/^"(.*?)" field displays warning Icon$/, function (formField) {
    cy.getFormGroup(formField).find('i.oi-warning').should('be.visible');
});

Then(/^"(.*?)" field does not display warning Icon$/, function (formField) {
    cy.getFormGroup(formField).find('i.oi-warning').should('not.be.visible');
});


