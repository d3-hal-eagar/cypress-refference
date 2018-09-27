Feature: ex/step1-next-step.feature

    Submit Step 1 with valid data
    covers
    - CP-812 Mobile - EX - Step 1 - Submit and Continue Call-to-Action Button
    - CP-781 Desktop/Mobile - EX - Step 1 - Submit and Continue CTA

    Background: user on Step 1 acquisition flow screen
        Given I am a user on the ex flow
        Given I am on the ex step1 signup page


    Scenario: 1 - Without entering all required fields user selects Submit and Continue.
        And I click element "next-step-button"
        Then I am guided to the ex step1 signup page
        Then Action detail "System shall display a warning Icon inside all the required field elements that have not been completed."
            Then "firstName" field displays warning Icon
            And "firstName" input field shall be outlined in red
            Then "lastName" field displays warning Icon
            And "lastName" input field shall be outlined in red
            Then "street1" field displays warning Icon
            And "street1" input field shall be outlined in red
            Then "zip" field displays warning Icon
            And "zip" input field shall be outlined in red
            Then "city" field displays warning Icon
            And "city" input field shall be outlined in red
            # no icon for select
            And "state" input field shall be outlined in red
            Then "phone" field displays warning Icon
            And "phone" input field shall be outlined in red
            Then "email" field displays warning Icon
            And "email" input field shall be outlined in red
        Then Action detail "System shall by default focus on the First element with the error"
            Then Check that the "firstName" field is focused

    Scenario: 1a - Without entering certain required fields user selects Submit and Continue.
        When I have enter valid "firstName" value "John"
        And I click element "next-step-button"
        Then I am guided to the ex step1 signup page
        Then Action detail "System shall by default focus on the First element with the error"
        Then Check that the "lastName" field is focused

    Scenario: 2 - User submits form with valid information
        When I have enter valid "firstName" value "John"
        And I have enter valid "lastName" value "Smith"
        And I have enter valid "street1" value "22 Cortland street"
        And I have enter valid "street2" value "Fl 11"
        And I have enter valid "city" value "New York"
        And I select "NY" on the "state" field
        And I have enter valid "zip" value "11104"
        And I have enter valid "phone" value "212-555-5555"
        And I have enter valid "email" value "me@with.you"
        And I click element "next-step-button"
        Then I am guided to the ex step2 form page

    Scenario: 2 - User enters an invalid address and selects Submit and Continue Call-to-Action button upon entering all the required data.
        When I have enter valid "firstName" value "John"
        And I have enter valid "lastName" value "Smith"
        And I have enter valid "street1" value "14.5 Pillow street"
        And I have enter valid "street2" value "Fl 11"
        And I have enter valid "city" value "Pew York"
        And I select "NY" on the "state" field
        And I have enter valid "zip" value "11111"
        And I have enter valid "phone" value "212-555-5555"
        And I have enter valid "email" value "me@with.you"
        And I click element "next-step-button"

        Then The "container-inline-message" message contains "We could not verify the address you provided:"
        And The "container-inline-message" message contains "Please make changes or enter a new address. If this is your correct address, click "Submit and Continue""
        And The "container-inline-message" message contains "14.5 Pillow street"
        And The "container-inline-message" message contains "Pew York"
        And The "container-inline-message" message contains "11111"
        And I click element "next-step-button"
        Then I am guided to the ex step2 form page

    Scenario: 3 - User enters an invalid current address and invalid previous address and selects Submit and Continue Call-to-Action button upon entering all the required data.
        When I have enter valid "firstName" value "John"
        And I have enter valid "lastName" value "Smith"
        And I have enter valid "street1" value "14.5 Pillow street"
        And I have enter valid "street2" value "Fl 11"
        And I have enter valid "city" value "Pew York"
        And I select "NY" on the "state" field
        And I have enter valid "zip" value "11111"
        And I have enter valid "phone" value "212-555-5555"
        And I have enter valid "email" value "me@with.you"

        When I click on the "continuousResidenceNo" field
            And I have enter valid "street1 in previous-address-section" value "# Cortland st"
            And I have enter valid "city in previous-address-section" value "New Pork"
            And I select "AK" on the "state in previous-address-section" field
            And I have enter valid "zip in previous-address-section" value "77777"
        When I click element "next-step-button"
        Then The "container-inline-message" message contains "We could not verify the address you provided:"
        And The "container-inline-message" message contains "Please make changes or enter a new address. If this is your correct address, click "Submit and Continue""
        And The "container-inline-message" message contains "14.5 Pillow street"
        And The "container-inline-message" message contains "Pew York"
        And The "container-inline-message" message contains "11111"

        And The "container-inline-message" message contains "# Cortland st"
        And The "container-inline-message" message contains "New Pork"
        And The "container-inline-message" message contains "77777"
        And I click element "next-step-button"
        Then I am guided to the ex step2 form page

    Scenario: 2 - User enters an valid address missing apartment
        When I have enter valid "firstName" value "John"
        And I have enter valid "lastName" value "Smith"
        And I have enter valid "street1" value "4135 45th st"
        And I have enter valid "city" value "Queens"
        And I select "NY" on the "state" field
        And I have enter valid "zip" value "11104"
        And I have enter valid "phone" value "212-555-5555"
        And I have enter valid "email" value "me@with.you"
        And I click element "next-step-button"

        Then The "container-inline-message" message contains "We could not verify the address you provided:"
        And The "container-inline-message" message contains "Please make changes or enter a new address. If this is your correct address, click "Submit and Continue""
        And The "container-inline-message" message contains "14.5 Pillow street"
        And The "container-inline-message" message contains "Pew York"
        And The "container-inline-message" message contains "11111"
        And I click element "next-step-button"
        Then I am guided to the ex step2 form page
