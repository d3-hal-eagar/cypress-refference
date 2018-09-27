Feature: ck/step1-fieldValidation-communicationPreferences.feature

  Covers
    - CP-1485 Desktop/Mobile - CK - Step 1 Page - Communication Preferences Option
  Validation Criteria
    - Not a required field.


  Background: user on Step 1 acquisition flow screen
    Given I am a user on the ck flow
    Given I am on the ck step1 signup page
    Given the siteName is "NotCreditKarma"



  Scenario: 1 Display
    #And The a subheader exists "Communication Preferences"
    Then "communication-preferences-header" contains "Communication Preferences"
    Then "inform-message" contains "Inform me about updates to my credit report and important notifications related to my credit profile."
#warning-communication-mesage

  Scenario: 2 Default Selected Checkbox State
    Then Check that the "wantsUpdates" field is checked
    When I click on the "wantsUpdates" field
    Then Check that the "wantsUpdates" field is not checked
    When I click on the "wantsUpdates" field
    Then Check that the "wantsUpdates" field is focused
    Then Check that the "wantsUpdates" field is checked
    When I blur the "wantsUpdates" field

  Scenario: 3 You Must Alert
    #wantsUpdates-text
    Then Check that the "warning-message" is not visible
    When I click on the "wantsUpdates" field
    Then Check that the "warning-message" is visible
    And "warning-message" contains "Warning: You must elect to receive important notifications from"
    And "warning-message" contains "to participate in free credit monitoring."
    And The "warning-message" message contains siteName
    When I click on the "wantsUpdates" field
    Then Check that the "warning-message" is not visible

  Scenario: 5 Onward

    When I click on the "wantsUpdates" field
    Then Check that the "wantsUpdates" field is not checked
    When I have enter valid "email" value "test@credmo.com"
    And I have enter valid "password" value "asdf1234$RFV"
    And I click element "next-step-button"
    Then I am guided to the ck step2 form page
