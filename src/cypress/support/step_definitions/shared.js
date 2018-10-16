/* global cy, Cypress, then, when, given, Then, When, Given  */
/// <reference types="Cypress" />
(function() {
    "use strict";

    Then (/^nothing happens$/, () => {
       cy.log('this as an assertion probably invalidates the whole test');
    });

    Then(/^I see "(.*?)" in the title$/, (title) => {
        cy.title().should('include', title);
    });

    Then(/^take screenshot named "(.*?)"$/, (filename) => {
        cy.screenshot(filename);
    });

    Then("take screenshot", () =>{
        cy.screenshot();
    });

    When(/^I am on the "(.*?)" page$/, (pageName) => {
        // no host info, so it will use baseURL as set in cypress.json or env variable CYPRESS_baseURL
        cy.visit(pageName);
    });

    When(/^I am guided to "(.*?)"/, (pageName) => {
        cy.url.should('eq',pageName);
    });

    Then(/^The page header is "(.*?)"$/, (headerText) => {
        cy.getElement('section-title').contains(headerText).should('be.visible');
    });

    Then(/^The a subheader exists "(.*?)"$/, (headerText) => {
        cy.get('h4').contains(headerText).should('be.visible');
    });

    Then(/^The form title is "(.*?)"$/, (headerText) => {
        cy.getElement('title').contains(headerText).should('be.visible');
    });

    Then(/^The form header is "(.*?)"$/, (headerText) => {
        cy.getElement('header').contains(headerText).should('be.visible');
    });

    Then(/^The page contains "(.*?)"$/, (headerText) => {
        cy.get('body').contains(headerText).should('be.visible');
    });

    Then(/^The "(.*?)" element present on the page$/, (element) => {
        cy.getElement(element).should('be.visible');
    });

    Then(/^The "(.*?)" element is not present on the page$/, (element) => {
        cy.getElement(element).should('not.be.visible');
    });

    Then(/^The "(.*?)" image is displayed on the page$/, (dataTest) => {
        cy.get('[data-test='+dataTest+']>h3>img').should('be.visible');
    });

    Then(/^The "(.*?)" element present on the mobile page only$/, (element) => {
        if (Cypress.env('TESTMODE') === 'mobile') {
            cy.getElement(element).should('be.visible');
        } else {
            cy.getElement(element).should('not.be.visible');
        }
    });

    Then(/^The "(.*?)" element present on the desktop page only$/, (element) => {
        if (Cypress.env('TESTMODE') === 'mobile') {
            cy.getElement(element).should('not.be.visible');
        } else {
            cy.getElement(element).should('be.visible');
        }
    });

    Then(/^The "(.*?)" element is not present on the page$/, (element) => {
        cy.getElement(element).should('not.be.visible');
    });

    Then(/^"(.*?)" contains "(.*?)"$/, (element, messageText) => {
        cy.getElement(element).should('contain', messageText);
    });

    Then(/^"(.*?)" parent div contains "(.*?)"$/, (element, messageText) => {
        cy.getElement(element).closest('div').should('contain', messageText);
    });

    let proprietaryNames = [];
    Given(`the following list of proprietaryNames`, function (dataTable) {
        proprietaryNames = dataTable.rawTable;
    });

    Then(`screen does not contain any proprietaryNames`, function () {
        for (let rowindex = 0, rows = proprietaryNames.length; rowindex < rows; rowindex++) {

            let badName = proprietaryNames[rowindex][0];
            let badNameTitleCase = proprietaryNames[rowindex][0];
            badNameTitleCase = badNameTitleCase.replace(/\w\S*/g, function(txt){
                return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();
            });
            let badNameLowercase = badName.toLowerCase();
            let badNameSentenceCase = badNameLowercase.charAt(0).toUpperCase() + badNameLowercase.slice(1);
            let badNameCram = badName.replace(/\s/g, '');
            let badNameTitleCaseCram = badNameTitleCase.replace(/\s/g, '');
            let badNameLowercaseCram = badNameCram.toLowerCase();
            let badNameSentenceCaseCram = badNameSentenceCase.replace(/\s/g, '');
            let badNameCamel = badNameTitleCaseCram.charAt(0).toLowerCase() + badNameTitleCaseCram.slice(1);


                                         cy.log('badName: '+badName);
            cy.get('body').should('not.contain', badName);
                                         cy.log('badNameTitleCase: '+badNameTitleCase);
            cy.get('body').should('not.contain', badNameTitleCase);
                                         cy.log('badNameLowercase: '+badNameLowercase);
            cy.get('body').should('not.contain', badNameLowercase);
                                         cy.log('badNameSentenceCase: '+badNameSentenceCase);
            cy.get('body').should('not.contain', badNameSentenceCase);
                                         cy.log('badNameCram: '+badNameCram);
            cy.get('body').should('not.contain', badNameCram);
                                         cy.log('badNameTitleCaseCram: '+badNameTitleCaseCram);
            cy.get('body').should('not.contain', badNameTitleCaseCram);
                                         cy.log('badNameLowercaseCram: '+badNameLowercaseCram);
            cy.get('body').should('not.contain', badNameLowercaseCram);
                                         cy.log('badNameSentenceCaseCram: '+badNameSentenceCaseCram);
            cy.get('body').should('not.contain', badNameSentenceCaseCram);
                                         cy.log('badNameCamel: '+badNameCamel);
            cy.get('body').should('not.contain', badNameCamel);
        }
    });

    Then(/^The "(.*?)" field border is displayed in green/, function (formField) {
        cy.get('@_flow_specific').then((flow_specific) => {
            //cy.getFormGroup(formField).find('select.valid').should('be.visible');
            cy.getElement(formField).should('have.class', 'valid');
            cy.getElement(formField).should('have.css', 'border-color', flow_specific.validGreen);
        });
    });

    Then(/^The "(.*?)" field border is outlined in red color/, function (formField) {
        cy.get('@_flow_specific').then((flow_specific) => {
            cy.getElement(formField).should('have.class', 'invalid');
            cy.getElement(formField).should('have.css', 'border-color', flow_specific.errorRedBorder);
        });
    });

    Then(/^The "(.*?)" field border shall have a highlighted focus border/, function (formField) {
        cy.get('@_flow_specific').then((flow_specific) => {
            cy.getElement(formField).should('have.css', 'border-color', flow_specific.selectBorder);
        });
    });

    Then(/^The "(.*?)" field border shall have a default border/, function (formField) {
        cy.get('@_flow_specific').then((flow_specific) => {
            cy.getElement(formField).should('have.css', 'border-color', flow_specific.defaultBorder);
        });
    });

    Then(/^A green checkmark inside the "(.*?)" field is displayed/, function (formField) {
        cy.getFormGroup(formField).find('i.oi.oi-circle-check').should('be.visible');
        cy.getFormGroup(formField).find('i.text-valid').should('have.css', 'color', 'rgb(47, 186, 120)');
    });

    Then(/^I shall not be displayed any errors or validation markup on non required field "(.*?)"/, function (formField) {
        cy.getFormGroup(formField).find('input.valid').should('not.be.visible');
        cy.getFormGroup(formField).find('input').should('not.have.css', 'border-color', 'rgb(37, 145, 94)');
        cy.getFormGroup(formField).find('i.oi.oi-circle-check').should('not.be.visible');
        cy.getFormGroup(formField).find('i.text-valid').should('not.have.css', 'color', 'rgb(47, 186, 120)');
    });

    Then(/^The "(.*?)" message contains "(.*?)"$/, (element, messageText) => {
        cy.getElement(element).should('contain', messageText);
    });

    Then(/^The "(.*?)" message contains "(.*?)" on the desktop page only$/, (element, messageText) => {
        if (Cypress.env('TESTMODE') !== 'mobile') {
            cy.getElement(element).should('contain', messageText);
        }
    });

    Then(/^The "(.*?)" message contains "(.*?)" on the mobile page only$/, (element, messageText) => {
        if (Cypress.env('TESTMODE') === 'mobile') {
            cy.getElement(element).should('contain', messageText);
        }
    });

    Then(/^I am displayed the correct message on "(.*?)"$/, (element,messageText) => {
        cy.getElement(element).contains(messageText);
    });

    When(/^I close the modal$/, () => {
        cy.getElement('modal-header').find('.close').click();
    });

    Then(/^the modal is not visible$/, () => {
        cy.getElement('modal-header').should('not.be.visible');
        cy.get('.modal-content').should('not.be.visible');
    });

    When(/^I wait "(.*?)"$/, (milliseconds) => {
        cy.wait(milliseconds*1);
    });

})();
