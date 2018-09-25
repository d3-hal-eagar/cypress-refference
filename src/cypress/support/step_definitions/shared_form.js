/* global cy, then, when, given */

// noinspection JSUnusedLocalSymbols
When(/^without entering "(.*?)"$/, (formField) => {
    cy.getElement(formField).focus().blur().focus();
});

Then(/^I shall be displayed an error - "(.*?)"$/, (errorText) => {
    cy.contains(errorText).should('be.visible');
});

Then(/^I shall be displayed an error for the "(.*?)" field - "(.*?)"$/, (formField,errorText) => {
    cy.getFormGroup(formField).contains(errorText).should('be.visible');
});

Then(/^I shall be displayed an error for the "(.*?)" field$/, (formField) => {
    cy.get('@flow').then((flow) => {
        cy.getFormGroup(formField).find(flow.errorSelector).should('be.visible');
    });
});


Then(/^I shall be displayed an error for the "(.*?)" field - "(.*?)" in red$/, (formField,errorText) => {
    cy.get('@flow').then((flow) => {

        if ((formField.startsWith("ssn") && flow.flowName === 'ck') || formField.startsWith("dob")) {
            // e.g. ssn-error-message, dob-error-message
            cy.get('div[data-test='+formField+'-error-message]'+flow.errorSelector).contains(errorText).should('be.visible');
            cy.getElement(formField+'-error-message').should('have.css', 'color', flow.errorRed);
        } else {
            cy.getFormGroup(formField).contains(errorText).should('be.visible');
            if (flow.flowName === 'ck') {
                cy.getFormGroup(formField).find('span'+flow.errorSelector).should('have.css', 'color', flow.errorRed);
            } else if (flow.flowName === 'ex') {
                cy.getFormGroup(formField).find(flow.errorSelector).should('have.css', 'background-color', flow.errorRedBorder);
            }
        }
    });
});

Then(/^"(.*?)" select field is displayed in red$/, function (formField) {
    cy.get('@flow').then((flow) => {
        if (flow.flowName === 'ck') {
            cy.getFormGroup(formField).find('select'+flow.errorClass).should('be.visible');
            cy.getFormGroup(formField).find('select').should('have.css', 'color', flow.errorRed);
        } else if (flow.flowName === 'ex') {
            cy.getFormGroup(formField).find('select'+flow.errorClass).should('be.visible');
            cy.getFormGroup(formField).find('select').should('have.css', 'border-color', flow.errorRedBorder);
        }

    });
});

Then(/^"(.*?)" select field is bordered in green$/, function (formField) {
    cy.get('@flow').then((flow) => {
        cy.getFormGroup(formField).find('select'+flow.errorSelector).should('not.be.visible');
        cy.getFormGroup(formField).find('select').should('have.css', 'border-color', flow.validGreen);
    });
});

Then(/^"(.*?)" select field is displayed in black$/, function (formField) {
    cy.get('@flow').then((flow) => {
        cy.getFormGroup(formField).find('select').should('have.css', 'color', flow.textBlack);
    });
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
    cy.getElement(formField).clear().type(userInput).blur().focus();
});

Then(/^"(.*?)" value is "(.*?)"$/, (formField,userInput) => {
    cy.getElement(formField).should('have.value', userInput);
});

// noinspection JSUnusedLocalSymbols
When(/^I have enter a valid "(.*?)" value "(.*?)" that "(.*?)"$/, (formField,userInput, typeOfValidation) => {
    cy.getElement(formField).clear().type(userInput).blur().focus();
});

When(/^I enter additional text into "(.*?)" field text "(.*?)"$/, (formField,userInput) => {
    // no clear on this one, that's intentional
    cy.getElement(formField).type(userInput);
});

// noinspection JSUnusedLocalSymbols
When(/^I have enter invalid "(.*?)" value "(.*?)" that "(.*?)"$/, (formField,userInput, typeOfValidationFailure) => {
    cy.getElement(formField).clear().type(userInput).blur().focus();
});

When(/^I select "(.*?)" on the "(.*?)" field$/, (userInput, formField) => {
    cy.getElement(formField).focus().select(userInput).blur().focus();
});


When(/^I select 18yrs ago on the "(.*?)" field$/, (formField) => {
    const thisYear = (new Date()).getFullYear();
    const selectYear = (Number(thisYear)-18).toString()
    cy.getElement(formField).focus().select(selectYear).blur().focus();
});

// Then(/^I shall be displayed "(.*?)" option for the "(.*?)" field that has "(.*?)" index$/, (userInput, formField, optionIndex) => {
//     cy.getElement(formField).children().eq(optionIndex).should('be.selected', userInput);
// });

Then(/^I shall be displayed no errors$/, () => {
    cy.get('@flow').then((flow) => {
        cy.get(flow.errorSelector).should('not.be.visible');
    });
});

Then(/^I shall be displayed no error for the "(.*?)" field$/, (formField) => {
    cy.get('@flow').then((flow) => {
        if (formField.startsWith("ssn") || formField.startsWith("dob")) {
            cy.getElement(formField+'-error-message').should('not.be.visible');
        }
        else {
            cy.getFormGroup(formField).find(flow.errorSelector).should('not.be.visible');
        }
    });
});

Then(/^"(.*?)" field displays check Icon$/, function (formField) {
    cy.getFormGroup(formField).find('i.oi.oi-circle-check').should('be.visible');
});

// noinspection JSUnusedLocalSymbols
Given(/^Action detail "(.*?)"/, (descriptionText) => {
    // this is a placeholder step used to describe lack of action for clarity
});

Then(/^I am restricted from entering more than "(.*?)" characters in "(.*?)" field$/, (lengthLimit,formField) => {
    cy.getElement(formField).invoke('val').then((text) => {
        expect(text.length).to.eq(parseInt(lengthLimit));
    })
});

Then(/^"(.*?)" field is "(.*?)" characters in length$/, (formField,lengthLimit) => {
    cy.getElement(formField).invoke('val').then((text) => {
        expect(text.length).to.eq(parseInt(lengthLimit));
    })
});

// Then(/^The X Icon is displayed inside the "(.*?)" input field$/, function (formField) {
//     cy.getFormGroup(formField).find('i.oi.oi-circle-x').should('be.visible');
// });

When(/^I have enter invalid "(.*?)" value I see the correct validation error message$/, function (formField,dataTable) {
    cy.get('@flow').then((flow) => {
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
            else if(formField === 'phone'){
                validInput = '5555551234';
            }
            else if(formField === 'email'){
                validInput = 'jdoe@example.com';
            }
            // log test intent this is otherwise lost when doing multiple tests in a single step
            cy.log('(example #'+rowindex+') I have enter invalid '+formField+' value "'+userInput+'" that '+errorType+' and am displayed an error "'+errorText+'"');
            // chained actions clear previous error
            // re-enter text and check for error
            cy.getElement(formField).clear().type(validInput).blur().focus()
              .getFormGroup(formField).find(flow.errorSelector).should('not.be.visible')
              .getElement(formField).clear().type(userInput).blur().focus();
            if(formField.startsWith("ssn") || formField.startsWith("dob")){
                cy.getElement(formField+'-error-message').contains(errorText).should('be.visible')
            }
            else {
                cy.getFormGroup(formField).contains(errorText).should('be.visible');
            }
        }

    });
});


When(/^I have enter valid "(.*?)" value I do not see the validation error message$/, function (formField,dataTable) {
    cy.get('@flow').then((flow) => {
        // starting at rowindex 1 to skip header row
        for (let rowindex = 1, rows = dataTable.rawTable.length; rowindex < rows; rowindex++) {
            let userInput = dataTable.rawTable[rowindex][0];

            // log test intent this is otherwise lost when doing multiple tests in a single step
            cy.log('(example #'+rowindex+') I have enter valid '+formField+' value "'+userInput+'"');
            // chained actions clear previous error
            // re-enter text and check for error
            cy.getElement(formField).clear().type(userInput).blur().focus()
                .getFormGroup(formField).find(flow.errorSelector).should('not.be.visible');
        }
    });
});


When(/^I have enter invalid characters "(.*?)" into valid input "(.*?)" on the "(.*?)" and I see validation error message "(.*?)"$/, function (characterList,validInput,formField,errorText) {
    cy.get('@flow').then((flow) => {
        // starting at rowindex 1 to skip header row
        for (let charindex = 0; charindex < characterList.length; charindex++) {
            let userInput = validInput.slice(0, -1) + characterList.substring(charindex, charindex+1);
            // log test intent this is otherwise lost when doing multiple tests in a single step
            cy.log('(example #'+charindex+') I have enter invalid '+formField+' value "'+userInput+'" and am displayed an error "'+errorText+'"');
            // chained actions clear previous error
            // re-enter text and check for error
            cy.getElement(formField).clear().type(validInput).blur().focus()
                .getFormGroup(formField).find(flow.errorSelector).should('not.be.visible');
            if (flow.flowName === 'ck') {
                cy.getElement(formField).clear().type(userInput).blur().focus()
                    .getFormGroup(formField).contains(errorText).should('be.visible');
            }
            else if (flow.flowName === 'ex') {
                cy.getElement(formField).clear().type(userInput).focus()
                    .getFormGroup(formField).contains(errorText).should('be.visible');
            }
        }
    });
});

Then(/^I shall be able to select only one "(.*?)" at a time$/, function (formField) {
    cy.getElement(formField).should('not.have','attr','multiple');
    cy.get('select[data-test='+formField+']').should('be.visible');
});

Then(/^I shall be displayed "(.*?)" option for the "(.*?)" field by default$/, (userInput, formField) => {
    cy.getElement(formField).focus().children().eq(0).should('be.selected', userInput);
});

Then(/^I shall be able to scroll within the options in "(.*?)" field$/, (formField) => {
    cy.getElement(formField).children().scrollTo('0%', '100%');
});

When(/^I have selected valid dobYear option I see the correct value$/, function () {
    const thisYear = (new Date()).getFullYear();
    const youngYear = thisYear - 18;
    const oldYear = thisYear - 99;
    const formField = 'dobYear';
    cy.get('@flow').then((flow) => {

        for (let year = youngYear; year > oldYear; year--) {
            // log test intent this is otherwise lost when doing multiple tests in a single step
            cy.log('(example #' + year + ') I have selected valid ' + year + ' option for the ' + formField + ' field that has ' + year + ' value');
            cy.getElement(formField).select(''+year).should('have.value', year.toString()).and('contain',year.toString())
                .getFormGroup(formField).find(flow.errorSelector).should('not.be.visible').wait(1);

        }
    });
});

When(/^I have selected valid "(.*?)" option I see the correct value$/, function (formField,dataTable) {
    cy.get('@flow').then((flow) => {
        // starting at rowindex 1 to skip header row
        for (let rowindex = 1, rows = dataTable.rawTable.length; rowindex < rows; rowindex++) {
            let optionName = dataTable.rawTable[rowindex][0];
            let optionValue = dataTable.rawTable[rowindex][1];
            // log test intent this is otherwise lost when doing multiple tests in a single step
            cy.log('(example #' + rowindex + ') I have selected valid ' + optionName + ' option for the ' + formField + ' field that has ' + optionValue + ' value');
            cy.getElement(formField).select(optionName).should('have.value', optionValue).and('contain',optionName)
                .getFormGroup(formField).find(flow.errorSelector).should('not.be.visible').wait(1);

        }
    });
});

Then(/^I select "(.*?)" on the "(.*?)" field and the correct value is displayed$/, (userInput, formField) => {
    cy.getElement(formField).select(userInput).should('be.selected').and('be.visible');
});

Then(/^I shall not be displayed invalid year in the "(.*?)" field$/, function (formField) {
    cy.getElement(formField).should('not.contain', ['2009','2010','2011','2012','2013','2014','2015','2016','2017','2018']);
});

Then(/^The "(.*?)" field label is "(.*?)"$/, (formField,labelText) => {

    cy.get('@flow').then((flow) => {
        if (formField.startsWith("ssn") || formField.startsWith("dob")){
            // e.g. ssn-label, dob-label
            cy.get('label[data-test='+formField+'-label]').contains(labelText).should('be.visible');
        } else {
            cy.getFormGroup(formField).find('label').contains(labelText).should('be.visible');
        }
    });
});

Then(/^The "(.*?)" radio group label is "(.*?)"$/, (formField,labelText) => {
    cy.getFormGroup(formField).contains(labelText).should('be.visible');
});

Then(/^Check that the "(.*?)" is not visible$/, (formField) => {
    cy.getElement(formField).should('not.be.visible');
});

Then(/^Check that the "(.*?)" is visible$/, (formField) => {
    cy.getElement(formField).should('be.visible');
});

When(/^I select the checkbox on "(.*?)" field element$/, (formField) => {
    cy.getElement(formField).check().should('be.checked');
});

When(/^I unselect the checkbox on "(.*?)" field element$/, (formField) => {
    cy.getElement(formField).uncheck().should('not.be.checked');
});
