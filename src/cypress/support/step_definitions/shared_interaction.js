/* global cy, Cypress, then, when, given, Then, When, Given  */
/// <reference types="Cypress" />
(function() {
    "use strict";
    When(/^I select "(.*?)"$/, (buttonText) => {
        cy.contains(buttonText).click();
    });

    When(/^I focus on "(.*?)" drop-down field$/, (formField) => {
        cy.getElement(formField).select('').blur();
    });

    When(/^I click "(.*?)"$/, (linkText) => {
        cy.contains(linkText).click();
    });

    When(/^I click button "(.*?)"$/, (linkText) => {
        cy.get('button').contains(linkText).click();
    });

    When(/^I click link "(.*?)"$/, (linkText) => {
        cy.get('a').contains(linkText).click();
    });

    When(/^I click element "(.*?)"$/, (dataTest) => {
        cy.getElement(dataTest).click();
    });
})();
