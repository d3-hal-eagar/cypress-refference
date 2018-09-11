/* global cy, then, when, given */

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

Then(/^The page contians "(.*?)"$/, (headerText) => {
    cy.get('body').contains(headerText).should('be.visible');
});

Then(/^"(.*?)" contains "(.*?)"$/, (element, messageText) => {
    cy.getElement(element).should('contain', messageText);
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
    cy.getFormGroup(formField).find('input.valid').should('be.visible');
    cy.getFormGroup(formField).find('input').should('have.css', 'border-color', 'rgb(37, 145, 94)');
});

Then(/^The "(.*?)" select border is displayed in green/, function (formField) {
    cy.getFormGroup(formField).find('select.valid').should('be.visible');
    cy.getFormGroup(formField).find('select').should('have.css', 'border-color', 'rgb(37, 145, 94)');
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

When(/^I close the modal$/, () => {
    cy.getElement('modal-header').find('.close').click();
});

Then(/^the modal is not visible$/, () => {
    cy.getElement('modal-header').should('not.be.visible');
    cy.get('.modal-content').should('not.be.visible');

});
