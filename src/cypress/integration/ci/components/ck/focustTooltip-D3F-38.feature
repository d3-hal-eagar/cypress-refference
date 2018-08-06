Feature: CK Focus Tooltip

  As a user when I focus on the form fields in 'Tell us who you are' - Step 2 - I shall be displayed a tooltip.

  Background: user on Step 2 acquisition flow screen
    Given I am a user on the ck flow
    When I am on the ck step2 form page

  Scenario: 0 - no interaction with fields and no tooltips show
    When without entering "firstName"
    Then "firstName" tooltip is not visible
    Then "lastName" tooltip is not visible
    Then "street1" tooltip is not visible
    #apartment
    Then "street2" tooltip is not visible
    Then "ssn3" tooltip is not visible

  Scenario: 1 User on focusing First Name input field, is displayed a tooltip.
    When I click on the "firstName" field
    Then I am displayed a "firstName" tooltip - "You must provide your full, legal first name." on desktop only
#    And The First Name input field is outlined in blue #is browser behaviour just check selected
    Then Check that the "firstName" field is focused
    When I focus on the "section-title" field
    Then "firstName" tooltip is not visible


  Scenario: 2 User on focusing Last Name input field, is displayed a tooltip.
    When I click on the "lastName" field
    Then I am displayed a "lastName" tooltip - "You must provide your full, legal last name." on desktop only
    Then Check that the "lastName" field is focused
    When I focus on the "section-title" field
    Then "lastName" tooltip is not visible

  Scenario: 3 User on focusing Street Address input field, is displayed a tooltip.
    When I click on the "street1" field
    Then I am displayed a "street1" tooltip - " Moved in the last 6 months? Try using your previous address instead." on desktop only
    Then Check that the "street1" field is focused
    When I focus on the "section-title" field
    Then "street1" tooltip is not visible

  Scenario: 4 User on focusing Apartment input field, is displayed a tooltip.
    #apartment
    When I click on the "street2" field
    Then I am displayed a "street2" tooltip - "Use this field to provide your apartment, suite, unit, or floor number." on desktop only
    Then Check that the "street2" field is focused
    When I focus on the "section-title" field
    Then "street2" tooltip is not visible

  Scenario: 5 User on focusing SSN field, is displayed a tooltip.
    When I click on the "ssn3" field
    Then I am displayed a "ssn3" tooltip - "We use your SSN to locate your credit file and retrieve your credit information." on desktop only
    Then Check that the "ssn3" field is focused
    When I focus on the "section-title" field
    Then "ssn3" tooltip is not visible

  Scenario: 6 As a user when I focus on any field, the field element is highlighted with a blue outline
    When I click on the "city" field
    Then Check that the "city" field is focused
    When I select "NY" on the "state" field
    Then Check that the "state" field is focused
    When I click on the "zip" field
    Then Check that the "zip" field is focused
    When I select "10" on the "dobMonth" field
    Then Check that the "dobMonth" field is focused
    When I select "22" on the "dobDay" field
    Then Check that the "dobDay" field is focused
    When I select "1970" on the "dobYear" field
    Then Check that the "dobYear" field is focused


  Scenario: 7 selected mode of a Checkbox
    Then Check that the "agreement" field is not checked
    When I click on the "agreement" field
    Then Check that the "agreement" field is focused
    Then Check that the "agreement" field is checked
    When I focus on the "section-title" field
    Then Check that the "agreement" field is checked
