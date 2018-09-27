Feature: ex/step1-content-fields.feature

  As a user when I am on Step 1 of acquisition flow then I am displayed the form fields

  covers
  - CP-826 Desktop - EX - Step 1 - About You - Input Fields
  - CP-767 Mobile - EX - Step 1 Page - About You - Input Fields


  Background: user on Step 2 acquisition flow screen
    Given I am a user on the ex flow
    When I am on the ex step1 signup page
    Given the siteName is "NotCreditExperian"


  Scenario: 1 As a user when I am on Step 1 of Experian Acquisition Flow then I am displayed the following form fields.
     When I click on the "firstName" field
    Then Check that the "firstName" field is focused
    And The "firstName" field label is "First Name"
    When I click on the "middleInitial" field
    Then Check that the "middleInitial" field is focused
    And The "middleInitial" field label is "Middle Initial"
    When I click on the "lastName" field
    Then Check that the "lastName" field is focused
    And The "lastName" field label is "Last Name"
    When I focus on the "suffix" field
    Then The "suffix" field label is "Suffix"
    When I click on the "street1" field
    Then Check that the "street1" field is focused
    And The "street1" field label is "Current Street Address"
    When I click on the "street2" field
    Then Check that the "street2" field is focused
    And The "street2" field label is "Apt, Unit, Bldg, Suite"
    When I click on the "zip" field
    Then Check that the "zip" field is focused
    And The "zip" field label is "ZIP Code"
    When I click on the "city" field
    Then Check that the "city" field is focused
    And The "city" field label is "City"
    When I focus on the "state" field
    Then The "state" field label is "State"
    When I click on the "continuousResidenceYes" field
    Then Check that the "continuousResidenceYes" field is focused
    Then Check that the "continuousResidenceYes" field is checked
    When I click on the "continuousResidenceNo" field
    Then Check that the "continuousResidenceNo" field is focused
    Then Check that the "continuousResidenceNo" field is checked
    Then Check that the "continuousResidenceYes" field is not checked
    And The "continuousResidenceYes" radio group label is "Have you lived at this address 6 months or more?"
    When I click on the "phone" field
    Then Check that the "phone" field is focused
    And The "phone" field label is "Phone Number"
    When I click on the "email" field
    Then Check that the "email" field is focused
    And The "email" field label is "Email Address"
    When I focus on the "reason" field
    Then The "reason" field label is "What is the main reason you are checking your credit?"

    #note we clicked no continuousResidenceNo so this is visible
    #When I click on the "continuousResidenceNo" field

    When I click on the "street1 in previous-address-section" field
    Then Check that the "street1" field is focused
    And The "street1 in previous-address-section" field label is "Previous Street Address"
    When I click on the "street2 in previous-address-section" field
    Then Check that the "street2" field is focused
    And The "street2 in previous-address-section" field label is "Apt, Unit, Bldg, Suite"
    When I click on the "zip in previous-address-section" field
    Then Check that the "zip" field is focused
    And The "zip in previous-address-section" field label is "ZIP Code"
    When I click on the "city in previous-address-section" field
    Then Check that the "city" field is focused
    And The "city in previous-address-section" field label is "City"
    When I focus on the "state in previous-address-section" field
    Then The "state" field label is "State"

    When I click on the "continuousResidenceYes" field
    Then Check that the "continuousResidenceNo" field is not checked
    Then Check that the "previous-address-section" is not visible


    And I focus on the "next-step-button" field
    Then Action detail "all fields were present"

  Scenario: 2 - test existence of messages and site name token
    Then The "signup-section containing title" message contains "Tell Us About Yourself"
    Then I shall be displayed the ex Progress Bar with Step1 highlighted in green as seen in the design
    And The form header is "About You"
    And The a subheader exists "About You"
    Then The "signup-section containing header" message contains "About You"
