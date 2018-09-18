Feature: Submit with Address Validation

    covers
        - CP-840 Desktop CK Step 2 Submit Invalid Zipcode

    Background: user on Step 2 acquisition flow screen
        Given I am a user on the ck flow
        Given I am on the ck step2 form page

    Scenario: 1 - User submits form with valid information but the zip code
        #Zip Code 11111 is valid on the FE but will be invalidated when validate/address api is called
        When I have enter valid "firstName" value "John"
        And I have enter valid "lastName" value "Smith"
        And I have enter valid "street1" value "22 Cortland streeet"
        And I have enter valid "street2" value "Fl 11"
        And I have enter valid "city" value "New York"
        And I select "NY" on the "state" field
        And I have enter valid "zip" value "11111"
        And I select "02" on the "dobMonth" field
        And I select "23" on the "dobDay" field
        And I select "1979" on the "dobYear" field
        And I have enter valid "ssn" value "1234"
        And I click element "agreement"
        And I click element "next-step-button"
        Then The "error-message-section" message contains "Whoops! Looks like we’re missing some important information."
        And The "error-message-section" message contains "You may have tried to continue to the next step too soon or missed a required field. Please ensure you've provided all of the required information before continuing. Missed entries are highlighted in red."
        And I shall be displayed an error for the "zip" field - "Please enter a valid zip code." in red
        #message for full ssn request
            #And I shall be displayed an error for the "ssn" field - "Please re-enter your SSN." in red
        #message for last 4 ssn request
        And I shall be displayed an error for the "ssn" field - "Please re-enter the last 4 digits." in red
