/* global cy, Cypress, then, when, given, Then, When, Given  */
/// <reference types="Cypress" />
(function() {
    "use strict";


    When(/^I have enter unique "(.*?)" value "(.*?)"$/, (formField,userInput) => {
        userInput = userInput.replace(/com/, Math.random()+'.com');
        cy.getElement(formField).clear().type(userInput).blur();
    });

    Given(/^Register "(.*?)"$/, (identity) => {

        let identityString = identity.replace(/\s/g, '_');
        identityString = identityString.toLowerCase();
        cy.log(identityString);
        cy.fixture(identityString+'_application.json').then((applicationJSON) => {
            cy.log(applicationJSON['email']);
            applicationJSON['email'] = applicationJSON['email'].replace(/com/, Math.random()+'.com');
            cy.log(applicationJSON['email']);
            cy.request('POST', 'http://localhost:3000/api/v1/application', applicationJSON).then((aresponse) => {
                // cy.fixture(identityString+'_auth.json').then((authJSON) => {
                //     cy.request('POST', 'http://localhost:3000/api/v1/auth', authJSON).then((bresponse) => {
                //
                //     });
                // });
            });
        });
        cy.fixture(identityString+'_localstorage.json').then((localstorageJSON) => {
            cy.clearLocalStorage('nothing').then((ls) => {
                ls.setItem('store',JSON.stringify(localstorageJSON));
            });
        });
    });

    Given(/^Mock KBA$/, () => {
        cy.fixture('mock_kba.json').as('kbaQuestionsJSON');
        cy.server();           // enable response stubbing
        cy.route({
            method: 'GET',      // Route all GET requests
            url: '/api/v1/kba/*',    // that have a URL that matches
            response: '@kbaQuestionsJSON',        // and force the response to be:
            status: 200,
            delay: 100,
        }).as('kbaQuestionsCall');
    });

    Given(/^Mock KBA pass$/, () => {
        cy.server();
        cy.route({
            method: 'POST',
            url: '/api/v1/kba/*',
            response: '{"message":"Ok"}',
            status: 202,
            delay: 100,
        }).as('kbaPassCall');
    });

    Given(/^Mock KBA fail/, () => {
        cy.server();
        cy.route({
            method: 'POST',
            url: '/api/v1/kba/*',
            response: '{"message":"Unauthorized","errors":{"code":701}}',
            status: 401,
            delay: 100,
        }).as('kbaFailCall');
    });

    Given(/^Mock KBA secondRound/, () => {
        cy.fixture('mock_kba_second.json').as('kbaQuestionsTwoJSON');
        cy.server();
        cy.route({
            method: 'POST',      // Route all GET requests
            url: '/api/v1/kba/*',    // that have a URL that matches
            response: '@kbaQuestionsTwoJSON',        // and force the response to be:
            status: 202,
            delay: 100,
        }).as('kbaQuestionsTwoJSON');
    });

    Given(/^Mock Report for "(.*?)"$/, (identity) => {

        let identityString = identity.replace(/\s/g, '_');
        identityString = identityString.toLowerCase();
        cy.fixture(identityString+'_report.json').as('reportJSON');
        cy.server();           // enable response stubbing
        cy.route({
            method: 'GET',      // Route all GET requests
            url: '/api/v1/scores/*',    // that have a URL that matches
            //response: '@reportJSON',        // real data not working
            //response: '{"html":"<!DOCTYPE html>\\n<html lang=\\"en\\"><head<title>1b report</title></head><body><div data-test=\"fake-report\">this would be report<div class=\"score left scoreVal score_sm\">TUIS</div></div></body></html>""}',
            response: '{"html":"<div data-test="fake-report">this would be report</div>"}',        // and force the response to be:
            status: 200,
            delay: 100,
        }).as('scoresCall');
    });

    Given(/^Mock scores-quick "(.*?)"$/, (score) => {
        cy.wrap({value:score}).as('_score');
        cy.server();           // enable response stubbing
        cy.route({
            method: 'GET',      // Route all GET requests
            url: '/api/v1/scores/quick/*',    // that have a URL that matches
            response: '{"score":'+score+'}',        // and force the response to be:
            status: 200,
            delay: 100,
        }).as('scoresQuickCall');
    });

})();
