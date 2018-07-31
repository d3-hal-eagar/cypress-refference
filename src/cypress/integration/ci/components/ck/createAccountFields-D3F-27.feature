Feature: Step 1 Create your account fields

  As a user I create an account by providing valid email and password
  Covers
  - D3F-27 Create your account fields
  - D3F-332 Mobile - Create your account fields
  - D3F-35 Next Step 'Call-to-action' Button
  - D3F-344 Mobile - Next Step 'Call-to-action' Button in Step 1
  - D3F-217 As a user when I am on Step 1 of acquisition path, I am displayed blocks of information on the right rail

  Background:
    Given I am a user on the ck flow
    Given I am on the ck step1 signup page

  Scenario: As a user when I am on Step 1 of acquisition path, I am displayed blocks of information on the right rail
    #D3F-217
    Given the siteName is "NotCreditKarma"
    Then I am displayed the following on the 'right rail'

    #D3F-27
  Scenario: System applies a blue glow border around active form elements
    Then The page header is "You're on your way to free credit scores."
    When I focus on the "email" field
    Then The "email" field is focused
    When I focus on the "password" field
    Then The "password" field is focused

    #D3F-35
  Scenario: 1 User enters information on the email address and password fields
    When I have enter valid "email" value "test@credmo.com"
    And I have enter valid "password" value "asdf1234$RFV"
    #clicking the checkbox twice needed to proceed, this is a temporary placeholder that needs to be removed
    #And I click "Inform me about updates to my credit report and important notifications related to my credit profile."
    # And I click "Inform me about updates to my credit report and important notifications related to my credit profile."
    And I click button "Next Step"
    Then I shall be guided to Step 2 screen

  Scenario: 2 User without entering a Password selects 'Next Step' Call-to-action
    When I have enter valid "email" value "test@credmo.com"
    And without entering "password"
    And I click button "Next Step"
    # expected in D3F-35
    Then I shall be displayed an error for the "password" field - "Password is required."
    # actual  "Please enter a valid password."
    And "password" field label is displayed in red

  Scenario: 3 User without entering an Email Address select 'Next Step' Call-to-action.
    When I have enter valid "password" value "asdf1234$RFV"
    And without entering "email"
    And I click button "Next Step"
    # expected in D3F-35
    Then I shall be displayed an error for the "email" field - "Email is required"
    # actual "Please enter a valid email address."
    And "email" field label is displayed in red

  Scenario: 4 User enters invalid email address
    When I have enter invalid "email" value "invalid@email" that "lacks a TLD"
    And without entering "Password"
    And I click button "Next Step"
    And "email" field label is displayed in red
    Then I shall be displayed an error for the "email" field - "Email is not a valid email address"
    # actual Please enter a valid email address.

  Scenario: 5 User enters a password that does meet the password criteria.
    And I have enter invalid "password" value "asdf123" that "does not meet the required minimum character length"
    And without entering "Email Address"
    And I click button "Next Step"
    And "password" field label is displayed in red
    And "password" field displays X Icon
    Then I shall be displayed an error for the "password" field - "Passwords must be at least 8 characters."
