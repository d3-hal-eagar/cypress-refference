/* global cy, Cypress, then, when, given, Then, When, Given  */
/// <reference types="Cypress" />
(function() {
    "use strict";

    Then(/^I fill out 3 kba questions$/, function () {
        cy.get('[data-test=kba-question-1] [data-test=kba-option]').contains('None of the Above').closest('[data-test=kba-option]').find('[type=radio]').click();
        cy.get('[data-test=kba-question-2] [data-test=kba-option]').contains('None of the Above').closest('[data-test=kba-option]').find('[type=radio]').click();
        cy.get('[data-test=kba-question-3] [data-test=kba-option]').contains('None of the Above').closest('[data-test=kba-option]').find('[type=radio]').click();
    });

    Then(/^I fill out 1 kba questions$/, function () {
        cy.get('[data-test=kba-question-1] [data-test=kba-option]').contains('None of the Above').closest('[data-test=kba-option]').find('[type=radio]').click();
    });

    Then(/^I fill out kba questions correct answers and submit$/, function () {
        cy.get('body').then(($body) => {
            // the point here is we're doing our if checks in jQuery not a cy promise so we don't fail if it's not true
            let questionSelectorList = ['[data-test=kba-question-1]', '[data-test=kba-question-2]', '[data-test=kba-question-3]','[data-test=kba-question-4]'];
            let correctAnswerList = [
                {'question':'street name','answer':'Ashwood'},
                {'question':'employer','answer':'Iec'},
                {'question':'social security number issued','answer':'New Hampshire'},
                {'question':'auto loan','answer':'2000'}
            ];
            for (let questionSelector of questionSelectorList) {

                if ($body.find(questionSelector).length) {
                    // answer it what we hope is correctly
                    cy.get(questionSelector).then(($question) => {
                        let knownAnswer = false;
                        for (let correctAnswer of correctAnswerList) {
                            if ($question.find('.questions-title:contains("'+correctAnswer.question+'")').length && $question.find('[data-test=kba-option]:contains("'+correctAnswer.answer+'")').length) {
                                knownAnswer = true;
                                cy.get(questionSelector+' [data-test=kba-option]').contains(correctAnswer.answer).closest('[data-test=kba-option]').find('[type=radio]').click()
                                    .then(() => {
                                        if ($body.find('[data-test=kba-form]').length) {
                                            // click submit after each question, it will just give validate error until we are done
                                            cy.get('[data-test=cta-button]').click().wait(100).get('.loading-modal', { timeout: 20000 }).should('not.be.visible');
                                        }
                                    });;
                            }
                        }
                        if (!knownAnswer) {
                            cy.get(questionSelector+' [data-test=kba-option]').contains('None of the Above').closest('[data-test=kba-option]').find('[type=radio]').click()
                                .then(() => {
                                    if ($body.find('[data-test=kba-form]').length) {
                                        // if we are on a kba form submit it
                                        cy.get('[data-test=cta-button]').click().wait(100).get('.loading-modal', { timeout: 20000 }).should('not.be.visible');
                                    }
                                });
                        }
                    });
                }
            }
        });
    });

    Then(/^I fill out kba questions and submit$/, function () {
        // the reason for this is I may get 1 2 or 3 pages of KBA questions
        // and each page may have 1-4 questions
        // only after the form is no longer returned will we expect the next page state
        // just mea culpa smashing Cypress best practices here doing conditional behavior

        cy.get('body').then(($body) => {
            let questionSelectorList = ['[data-test=kba-question-1]', '[data-test=kba-question-2]', '[data-test=kba-question-3]','[data-test=kba-question-4]'];
            for (let questionSelector of questionSelectorList) {
                if ($body.find(questionSelector).length) {
                    // answer it and submit it
                    cy.get(questionSelector+' [data-test=kba-option]').contains('None of the Above').closest('[data-test=kba-option]').find('[type=radio]').click()
                        .then(() => {
                            cy.get('[data-test=cta-button]').click().wait(100).get('.loading-modal', {timeout: 20000}).should('not.be.visible');
                        });
                }
            }
        });
    });

    Then(/^I fill out kba questions and stop/, function () {

        cy.get('body').then(($body) => {
            let questionSelectorList = ['[data-test=kba-question-1]', '[data-test=kba-question-2]', '[data-test=kba-question-3]','[data-test=kba-question-4]'];
            for (let questionSelector of questionSelectorList) {
                if ($body.find(questionSelector).length) {
                    cy.get(questionSelector+' [data-test=kba-option]').contains('None of the Above').closest('[data-test=kba-option]').find('[type=radio]').click();
                }
            }
        });
    });

    Then(/^The cfs "(.*?)" field label is "(.*?)" on the mobile page only$/, (formField,labelText) => {
        if (Cypress.env('TESTMODE') === 'mobile') {
            cy.getFormGroup(formField).find('label').contains(labelText).should('be.visible');
        } else {
            cy.get('label[data-test='+formField+'-label]').should('not.be.visible');
        }
    });

})();
