/* global cy, Cypress, then, when, given, Then, When, Given  */
/// <reference types="Cypress" />
(function() {
    "use strict";

    Then(/^"(.*?)" date is 7 days from now$/, (element) => {
        const weekfromNow = new Date();
        weekfromNow.setDate(weekfromNow.getDate() +7);
        const monthNames = ["Jan", "Feb", "March", "April", "May", "June", "July", "Aug", "Sept", "Oct", "Nov", "Dec"];
        const dateAsString = monthNames[weekfromNow.getMonth()]+' '+weekfromNow.getDate()+', '+weekfromNow.getFullYear();
        cy.getElement(element).contains(dateAsString).should('be.visible');
    });

    Then(/^"(.*?)" desktop "(.*?)" mobile date is 7 days from now$/, (desk_element,mob_element) => {
        const weekfromNow = new Date();
        weekfromNow.setDate(weekfromNow.getDate() +7);
        const monthNames = ["Jan", "Feb", "March", "April", "May", "June", "July", "Aug", "Sept", "Oct", "Nov", "Dec"];
        const dateAsString = monthNames[weekfromNow.getMonth()]+' '+weekfromNow.getDate()+', '+weekfromNow.getFullYear();
        if (Cypress.env('TESTMODE') === 'mobile') {
            cy.getElement(mob_element).contains(dateAsString).should('be.visible');
        } else {
            cy.getElement(desk_element).contains(dateAsString).should('be.visible');
        }
    });

    Then(/^"(.*?)" message contains current date$/, (element) => {
        const todaysDate = Cypress.moment().format('MMM DD, YYYY');
        cy.getElement(element).should('be.visible', todaysDate);
    });

    Then(/^"(.*?)" message contains date "(.*?)" days from now$/, (element, days) => {
        const dateIs = Cypress.moment().add(days, 'days').format('MMM DD, YYYY');
        cy.getElement(element).should('be.visible', dateIs);
    });
})();
