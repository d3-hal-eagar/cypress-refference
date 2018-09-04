/* global cy, then, when, given */

// noinspection JSUnusedLocalSymbols
When(/^without entering "(.*?)"$/, (fieldName) => {
    // this is a placeholder step used to describe lack of action for clarity
});

Then(/^I shall be displayed an error - "(.*?)"$/, (errorText) => {
    cy.contains(errorText).should('be.visible');
});

Then(/^I shall be displayed an error for the "(.*?)" field - "(.*?)"$/, (formField,errorText) => {
    cy.getFormGroup(formField).contains(errorText).should('be.visible');
});

Then(/^I shall be displayed an error for the "(.*?)" field$/, (formField) => {
    cy.getFormGroup(formField).find('.text-danger').should('be.visible');
});

Then(/^I shall be displayed an error for the "(.*?)" field - "(.*?)" in red font color$/, (formField,errorText) => {
    if (formField.startsWith("ssn") || formField.startsWith("dob")) {
        // e.g. ssn-error-message, dob-error-message
        cy.get('div[data-test='+formField+'-error-message].text-danger').contains(errorText).should('be.visible');
        cy.getElement(formField+'-error-message').should('have.css', 'color', 'rgb(220, 53, 69)');
    }
    else {
        cy.getFormGroup(formField).contains(errorText).should('be.visible');
        cy.getFormGroup(formField).find('span.text-danger').should('have.css', 'color', 'rgb(220, 53, 69)');
    }
});

When(/^I focus on the "(.*?)" field$/, (formField) => {
    cy.getElement(formField).focus();
});
When(/^I blur the "(.*?)" field$/, (formField) => {
    cy.getElement(formField).blur();
});

When(/^I click on the "(.*?)" field$/, (formField) => {
    cy.getElement(formField).click();
});

When(/^I click on the "(.*?)" element$/, (formField) => {
    cy.getFormGroup(formField).click('center', { force: true });
});

Then(/^Check that the "(.*?)" field is focused$/, (formField) => {
    cy.focused().should('have.attr', 'data-test', formField);
    // the test browser does not show the focused highlight correctly though this is known to work,
    // but that appears to be because the browser itself does not have focus.
});

Then(/^Check that the "(.*?)" field is not focused$/, (formField) => {
    cy.focused().should('not.have.attr', 'data-test', formField);
});

Then(/^Check that the "(.*?)" field is not checked/, function (formField) {
    //cy.getElement(formField).should('have.class', 'ng-invalid');
    //cy.get('[data-test='+formField+']:checked').should('not.be.visible');
    cy.getElement(formField).should('not.be.checked');
});

Then(/^Check that the "(.*?)" field is checked/, function (formField) {
    //cy.get('[data-test='+formField+']:checked').should('be.visible');
    cy.getElement(formField).should('be.checked');
});

When(/^I have enter valid "(.*?)" value "(.*?)"$/, (formField,userInput) => {
    cy.getElement(formField).clear().type(userInput);
});

When(/^I have enter a valid "(.*?)" value "(.*?)" that "(.*?)"$/, (formField,userInput, typeOfValidation) => {
    cy.getElement(formField).clear().type(userInput);
});

When(/^I enter additional text into "(.*?)" field text "(.*?)"$/, (formField,userInput) => {
    // no clear on this one, that's intentional
    cy.getElement(formField).type(userInput);
});

// noinspection JSUnusedLocalSymbols
When(/^I have enter invalid "(.*?)" value "(.*?)" that "(.*?)"$/, (formField,userInput, typeOfValidationFailure) => {
    cy.getElement(formField).clear().type(userInput);
});

When(/^I select "(.*?)" on the "(.*?)" field$/, (userInput, formField) => {
    cy.getElement(formField).focus().select(userInput);
});

// Then(/^I shall be displayed "(.*?)" option for the "(.*?)" field that has "(.*?)" index$/, (userInput, formField, optionIndex) => {
//     cy.getElement(formField).children().eq(optionIndex).should('be.selected', userInput);
// });

Then(/^I shall be displayed no errors$/, () => {
    cy.get('.text-danger').should('not.be.visible');
});

Then(/^I shall be displayed no error for the "(.*?)" field$/, (formField) => {
    if (formField.startsWith("ssn") || formField.startsWith("dob")) {
        cy.getElement(formField+'-error-message').should('not.be.visible');
    }
    else {
        cy.getFormGroup(formField).find('.text-danger').should('not.be.visible');
    }
});

Then(/^"(.*?)" field displays check Icon$/, function (formField) {
    cy.getFormGroup(formField).find('i.oi-circle-check').should('be.visible');
});

// noinspection JSUnusedLocalSymbols
Given(/^Action detail "(.*?)"/, (descriptionText) => {
    // this is a placeholder step used to describe lack of action for clarity
});

When(/^I am restricted from entering more than "(.*?)" characters in "(.*?)" field$/, (lengthLimit,formField) => {
    cy.getElement(formField).invoke('val').then((text) => {
        expect(text.length).to.eq(parseInt(lengthLimit));
    })
});

// Then(/^The X Icon is displayed inside the "(.*?)" input field$/, function (formField) {
//     cy.getFormGroup(formField).find('i.oi.oi-circle-x').should('be.visible');
// });

When(/^I have enter invalid "(.*?)" value I see the correct validation error message$/, function (formField,dataTable) {
    // starting at rowindex 1 to skip header row
    for (let rowindex = 1, rows = dataTable.rawTable.length; rowindex < rows; rowindex++) {
        let userInput = dataTable.rawTable[rowindex][0];
        let errorType = dataTable.rawTable[rowindex][1];
        let errorText = dataTable.rawTable[rowindex][2];
        let validInput = 'ax';
        if (formField === 'zip'){
            validInput = '12345';
        }
        else if(formField === 'ssn'){
            validInput = '1234';
        }
        // log test intent this is otherwise lost when doing multiple tests in a single step
        cy.log('(example #'+rowindex+') I have enter invalid '+formField+' value "'+userInput+'" that '+errorType+' and am displayed an error "'+errorText+'"');
        // chained actions clear previous error
        // re-enter text and check for error
        cy.getElement(formField).clear().type(validInput).blur()
          .getFormGroup(formField).find('.text-danger').should('not.be.visible')
          .getElement(formField).clear().type(userInput).blur();
        if(formField.startsWith("ssn") || formField.startsWith("dob")){
            cy.getElement(formField+'-error-message').contains(errorText).should('be.visible')
        }
        else {
            cy.getFormGroup(formField).contains(errorText).should('be.visible');
        }
    }

});

When(/^I have enter invalid characters "(.*?)" into valid input "(.*?)" on the "(.*?)" and I see validation error message "(.*?)"$/, function (characterList,validInput,formField,errorText) {
    // starting at rowindex 1 to skip header row
    for (let charindex = 0; charindex < characterList.length; charindex++) {
        let userInput = validInput.slice(0, -1) + characterList.substring(charindex, charindex+1);
        // log test intent this is otherwise lost when doing multiple tests in a single step
        cy.log('(example #'+charindex+') I have enter invalid '+formField+' value "'+userInput+'" and am displayed an error "'+errorText+'"');
        // chained actions clear previous error
        // re-enter text and check for error
        cy.getElement(formField).clear().type(validInput).blur()
            .getFormGroup(formField).find('.text-danger').should('not.be.visible')
            .getElement(formField).clear().type(userInput).blur()
            .getFormGroup(formField).contains(errorText).should('be.visible');
    }
});

When(/^I have enter invalid characters "(.*?)" into valid input "(.*?)" on the "(.*?)" and I see validation error message "(.*?)" on ex flow$/, function (characterList,validInput,formField,errorText) {
    // starting at rowindex 1 to skip header row
    for (let charindex = 0; charindex < characterList.length; charindex++) {
        let userInput = validInput.slice(0, -1) + characterList.substring(charindex, charindex+1);
        // log test intent this is otherwise lost when doing multiple tests in a single step
        cy.log('(example #'+charindex+') I have enter invalid '+formField+' value "'+userInput+'" and am displayed an error "'+errorText+'"');
        // chained actions clear previous error
        // re-enter text and check for error
        cy.getElement(formField).clear().type(validInput)
            .getFormGroup(formField).find('.text-danger').should('not.be.visible')
            .getElement(formField).clear().type(userInput)
            .getFormGroup(formField).contains(errorText).should('be.visible');
    }

});


Then(/^I shall be able to select only one "(.*?)" at a time$/, function (formField) {
    cy.getElement(formField).should('not.have','attr','multiple');
    cy.get('select[data-test='+formField+']').should('be.visible');
});

Then(/^I shall be displayed "(.*?)" option for the "(.*?)" field by default$/, (userInput, formField) => {
    cy.getElement(formField).children().eq(0).should('be.selected', userInput);
});

Then(/^I shall be able to scroll within the options in "(.*?)" field$/, (formField) => {
    cy.getElement(formField).children().scrollTo('0%', '100%');
});

When(/^I have selected valid "(.*?)" option I see the correct value$/, function (formField,dataTable) {
    // starting at rowindex 1 to skip header row
    for (let rowindex = 1, rows = dataTable.rawTable.length; rowindex < rows; rowindex++) {
        let optionName = dataTable.rawTable[rowindex][0];
        let optionValue = dataTable.rawTable[rowindex][1];
        // log test intent this is otherwise lost when doing multiple tests in a single step
        cy.log('(example #' + rowindex + ') I have selected valid ' + optionName + ' option for the ' + formField + ' field that has ' + optionValue + ' value');
        cy.getElement(formField).select(optionName).should('have.value', optionValue).and('contain',optionName)
            .getFormGroup(formField).find('.text-danger').should('not.be.visible').wait(5);

    }

});

Then(/^I select "(.*?)" on the "(.*?)" field and the correct value is displayed$/, (userInput, formField) => {
    cy.getElement(formField).select(userInput).should('be.selected').and('be.visible');
});

Then(/^I shall not be displayed invalid year in the "(.*?)" field$/, function (formField) {
    cy.getElement(formField).should('not.contain', ['2009','2010','2011','2012','2013','2014','2015','2016','2017','2018']);
});

Then(/^The "(.*?)" field label is "(.*?)"$/, (formField,labelText) => {
    if (formField.startsWith("ssn") || formField.startsWith("dob")){
        // e.g. ssn-label, dob-label
        cy.get('label[data-test='+formField+'-label]').contains(labelText).should('be.visible');
    } else {
        cy.getFormGroup(formField).find('label').contains(labelText).should('be.visible');
    }
});

Then(/^The "(.*?)" radio group label is "(.*?)"$/, (formField,labelText) => {
    cy.getFormGroup(formField).contains(labelText).should('be.visible');
});

Then(/^Check that the "(.*?)" is not visible$/, (formField) => {
    cy.getElement(formField).should('not.be.visible')
});
