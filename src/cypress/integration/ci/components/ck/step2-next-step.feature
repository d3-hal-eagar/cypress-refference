Feature: Submit Step 2 with valid data

covers
    - CP-785 Desktop - CK - Step 2 - Next Step Call-to-Action Button

    Background: user on Step 2 acquisition flow screen
        Given I am a user on the ck flow
        Given I am on the ck step2 form page


    Scenario: 2 - User submits form with incomplete information
        And I click element "agreement"
        And I click element "next-step-button"
        Then I am guided to the ck step2 form page
        And The "error-message-section" message contains "Whoops! Looks like we’re missing some important information. You may have tried to continue to the next step too soon or missed a required field. Please ensure you've provided all of the required information before continuing. Missed entries are highlighted in red."

    Scenario: 2 - User submits form with in-valid information
        When I have enter valid "firstName" value "John3"
        And I have enter valid "lastName" value "Smith$"
        And I have enter valid "street1" value "22 Cortland streeet"
        And I have enter valid "street2" value "Fl 11"
        And I have enter valid "city" value "New York"
        And I select "NY" on the "state" field
        And I have enter valid "zip" value "11104"
        And I select "02" on the "dobMonth" field
        And I select "23" on the "dobDay" field
        And I select "1979" on the "dobYear" field
        And I have enter valid "ssn" value "7896"
        And I click element "agreement"
        And I click element "next-step-button"
        Then I am guided to the ck step2 form page
        Then I shall be displayed an error for the "firstName" field - "First Name may not include numbers or special characters."

    Scenario: 2 - User submits form but is too young
        When I have enter valid "firstName" value "John"
        And I have enter valid "lastName" value "Smith"
        And I have enter valid "street1" value "22 Cortland streeet"
        And I have enter valid "street2" value "Fl 11"
        And I have enter valid "city" value "New York"
        And I select "NY" on the "state" field
        And I have enter valid "zip" value "11104"
        And I select "12" on the "dobMonth" field
        And I select "31" on the "dobDay" field
        And I select 18yrs ago on the "dobYear" field
        And I have enter valid "ssn" value "7896"
        And I click element "agreement"
        And I click element "next-step-button"
        Then I am guided to the ck step2 form page
        Then I shall be displayed an error for the "dob" field - "You must be 18 years or over to register." in red

    Scenario: 1 - User submits form with valid information
        When I have enter valid "firstName" value "John"
        And I have enter valid "lastName" value "Smith"
        And I have enter valid "street1" value "22 Cortland streeet"
        And I have enter valid "street2" value "Fl 11"
        And I have enter valid "city" value "New York"
        And I select "NY" on the "state" field
        And I have enter valid "zip" value "11104"
        And I select "02" on the "dobMonth" field
        And I select "23" on the "dobDay" field
        And I select "1979" on the "dobYear" field
        And I have enter valid "ssn" value "7896"
        And I click element "agreement"
        And I click element "next-step-button"
#        Then Action detail "only needed when ssn fails to validate a condition not yet implemented"
#        And I have enter valid "ssn1" value "12"
#        And I have enter valid "ssn2" value "45"
#        And I have enter valid "ssn" value "7896"
#        And I click element "next-step-button"
        Then I am guided to the ck step3 confirm page
