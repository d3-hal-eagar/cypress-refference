/* global cy, Cypress, then, when, given, Then, When, Given  */
/// <reference types="Cypress" />
(function() {
    "use strict";

    Given(`I am a user on the cfs flow`, () => {
        //www.notcheckfreescore.local
        cy.wrap({
            flowName: 'cfs',
            siteName: 'IasadGeas',
            errorSelector: '.error-container',
            errorClass: '.invalid',
            textBlack: 'rgb(0, 0, 0)',
            validGreen: 'rgb(0, 255, 0)',
            errorRed: 'rgb(238, 0, 0)',
            errorRedBorder: 'rgb(255, 0, 0)',
            selectBorder: 'rgb(128, 189, 255)',
            defaultBorder: 'rgb(206, 212, 218)',
            backgroundBlue: 'rgb(31, 47, 114)',
            backgroundWhite: 'rgb(255, 255, 255)'
        }).as('_flow_specific');
        cy.visit( '?marketingid=000');
        cy.wait(200);
    });

    Given(`I am a user on the ck flow`, () => {
        //www.notcreditkarma.local
        cy.wrap({
            flowName: 'ck',
            siteName: 'IasadGeas',
            errorSelector: '.text-danger',
            errorClass: '.text-danger',
            textBlack: 'rgb(73, 80, 87)',
            validGreen: 'rgb(206, 212, 218)',
            errorRed: 'rgb(220, 53, 69)',
            textDark: 'rgb(90, 92, 94)'
        }).as('_flow_specific');
        cy.visit( '?marketingid=00000');
        cy.wait(200);
    });

    Given(`I am a user on the ex flow`, () => {
        //www.notcreditexperian.local
        cy.wrap({
            flowName: 'ex',
            siteName: 'IasadGeas',
            errorSelector: '.error-container',
            errorClass: '.invalid',
            textBlack: 'rgb(73, 80, 87)',
            validGreen: 'rgb(37, 145, 94)',
            errorRed: 'rgb(203, 18, 62) none repeat scroll 0% 0% / auto padding-box border-box',
            errorRedBorder: 'rgb(203, 18, 62)',
            defaultBorder: 'rgb(206, 212, 218)',
            checkMarkGreen: 'rgb(47, 186, 120)'
        }).as('_flow_specific');
        cy.visit('?marketingid=11111');
        cy.wait(200);
    });

})();
