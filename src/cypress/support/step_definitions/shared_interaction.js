/* global cy, then, when, given */

When(/^I select "(.*?)"$/, (buttonText) => {
    cy.contains(buttonText).click();
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
