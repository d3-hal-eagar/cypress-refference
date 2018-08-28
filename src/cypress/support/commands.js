// ***********************************************
// This example commands.js shows you how to
// create various custom commands and overwrite
// existing commands.
//
// For more comprehensive examples of custom
// commands please read more here:
// https://on.cypress.io/custom-commands
// ***********************************************
//
//
// -- This is a parent command --
// Cypress.Commands.add("login", (email, password) => { ... })
//
//
// -- This is a child command --
// Cypress.Commands.add("drag", { prevSubject: 'element'}, (subject, options) => { ... })
//
//
// -- This is a dual command --
// Cypress.Commands.add("dismiss", { prevSubject: 'optional'}, (subject, options) => { ... })
//
//
// -- This is will overwrite an existing command --
// Cypress.Commands.overwrite("visit", (originalFn, url, options) => { ... })

function wrapWithDataId (dataTest) {
    var cssSelector = '';
    if (dataTest.match(/^(\.|#|\+)/)) {
        //if (dataTest.startsWith('#') || dataTest.startsWith('.')) {
        cssSelector = dataTest;
    } else if (dataTest.startsWith('<')) {
        cssSelector = dataTest.replace(/^<|>$/g, '');
    } else if (dataTest.startsWith('^')) {
        dataTest = dataTest.replace(/^\^/, '');
        cssSelector = '[data-test^='+dataTest+']';
    } else if (dataTest.startsWith('$')) {
        dataTest = dataTest.replace(/^\$/, '');
        cssSelector = '[data-test$='+dataTest+']';
    } else if (dataTest.startsWith('*')) {
        dataTest = dataTest.replace(/^\*/, '');
        cssSelector = '[data-test*='+dataTest+']';
    } else {
        cssSelector = '[data-test='+dataTest+']';
    }
    return cssSelector;
};


Cypress.Commands.add("getElement", (dataTest) => {
    var separatorsChildFirst = [' in ', ' on ', ' within '];
    var separatorsParentFirst = [' containing ', ' with '];
    var multiSelectorsChildFirst = dataTest.split(new RegExp(separatorsChildFirst.join('|'), 'g'));
    var multiSelectorsParentFirst = dataTest.split(new RegExp(separatorsParentFirst.join('|'), 'g'));
    if (multiSelectorsChildFirst.length == 2) {
        return cy.getChildElement(multiSelectorsChildFirst[1],multiSelectorsChildFirst[0]);
    }
    if (multiSelectorsParentFirst.length == 2) {
        return cy.getChildElement(multiSelectorsParentFirst[0],multiSelectorsParentFirst[1]);
    } else {
        var cssSelector = wrapWithDataId(dataTest);
        return cy.get(cssSelector);
    }
});

Cypress.Commands.add("getFormGroup", (dataTest) => {
    return cy.getElement(dataTest).closest('.form-group');
});

Cypress.Commands.add("getChildElement", (parentDataTest, childDataTest) => {
    var parentCssSelector = wrapWithDataId(parentDataTest);
    var childCssSelector = wrapWithDataId(childDataTest);
    return cy.get(parentCssSelector).find(childCssSelector);
});
