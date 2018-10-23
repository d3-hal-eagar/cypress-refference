/* global cy, Cypress, then, when, given, Then, When, Given  */
/// <reference types="Cypress" />
(function() {
    "use strict";

    Then(/^I incorrectly fill out 3 kba questions$/, function () {
        //todo better selectors
        cy.get('[data-test=kba-question-1] [data-test=kba-option]').contains('None of the Above').closest('[data-test=kba-option]').find('[type=radio]').click();
        cy.get('[data-test=kba-question-2] [data-test=kba-option]').contains('None of the Above').closest('[data-test=kba-option]').find('[type=radio]').click();
        cy.get('[data-test=kba-question-3] [data-test=kba-option]').contains('None of the Above').closest('[data-test=kba-option]').find('[type=radio]').click();
    });

    Then(/^I incorrectly fill out 1 kba questions$/, function () {
        //todo better selectors
        cy.get('[data-test=kba-question-1] [data-test=kba-option]').contains('None of the Above').closest('[data-test=kba-option]').find('[type=radio]').click();
    });

    Then(/^Maybe incorrectly fill out kba questions and submit$/, function () {
        // the reason for this is I may get 1 2 or 3 pages of KBA questions
        // and each page may have 1-4 questions
        // only after the form is no longer returned will we expect the next page state
        // just mea culpa smashing Cypress best practices here doing conditional behavior
        // also synchronously clicking the options
        cy.get('body').then(($body) => {
            // synchronously query from body
            // to find which element was created
            if ($body.find('[data-test=kba-question-2]').length) {
                // answer it
                cy.get('[data-test=kba-question-2] [data-test=kba-option]').contains('None of the Above').closest('[data-test=kba-option]').find('[type=radio]').click();
            }
            if ($body.find('[data-test=kba-question-3]').length) {
                // answer it
                cy.get('[data-test=kba-question-3] [data-test=kba-option]').contains('None of the Above').closest('[data-test=kba-option]').find('[type=radio]').click();
            }
            if ($body.find('[data-test=kba-question-4]').length) {
                // answer it
                cy.get('[data-test=kba-question-4] [data-test=kba-option]').contains('None of the Above').closest('[data-test=kba-option]').find('[type=radio]').click();
            }
            if ($body.find('[data-test=kba-question-1]').length) {
                // answer it and submit it
                cy.get('[data-test=kba-question-1] [data-test=kba-option]').contains('None of the Above').closest('[data-test=kba-option]').find('[type=radio]').click()
                    .then(() => {
                        cy.wait(100).get('[data-test=cta-button]').click().get('.loading-modal', { timeout: 15000 }).should('not.be.visible');
                });
            }
        });//.then(() => {});
    });

    Then(/^I correctly fill out kba questions$/, function () {
        cy.get('body').then(($body) => {
            // synchronously query from body
            // to find which element was created
            if ($body.find('[data-test=kba-question-2]').length) {
                // answer it
                cy.get('[data-test=kba-question-2] [data-test=kba-option]').contains('None of the Above').closest('[data-test=kba-option]').find('[type=radio]').click();
            }
            if ($body.find('[data-test=kba-question-3]').length) {
                // answer it
                cy.get('[data-test=kba-question-3] [data-test=kba-option]').contains('None of the Above').closest('[data-test=kba-option]').find('[type=radio]').click();
            }
            if ($body.find('[data-test=kba-question-4]').length) {
                // answer it
                cy.get('[data-test=kba-question-4] [data-test=kba-option]').contains('None of the Above').closest('[data-test=kba-option]').find('[type=radio]').click();
            }
            if ($body.find('[data-test=kba-question-1]').length) {
                // answer it and submit it
                cy.get('[data-test=kba-question-1] [data-test=kba-option]').contains('None of the Above').closest('[data-test=kba-option]').find('[type=radio]').click()
                    .then(() => {
                        cy.wait(100).get('[data-test=cta-button]').click().get('.loading-modal', { timeout: 15000 }).should('not.be.visible');
                    });
            }
        });//.then(() => {});
    });

    Then(/^The cfs "(.*?)" field label is "(.*?)" on the mobile page only$/, (formField,labelText) => {
        if (Cypress.env('TESTMODE') === 'mobile') {
            cy.getFormGroup(formField).find('label').contains(labelText).should('be.visible');
        } else {
            cy.get('label[data-test='+formField+'-label]').should('not.be.visible');
        }
    });

})();
