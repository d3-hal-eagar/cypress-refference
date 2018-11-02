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

})();
