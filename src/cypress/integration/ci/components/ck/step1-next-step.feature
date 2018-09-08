Feature: Step 1 Next Step button

  As a user I create an account by providing valid email and password
  Covers
  - CP-753 (D3F-332) Mobile - Create your account fields
  - CP-771 (D3F-35) Next Step 'Call-to-action' Button

  Tests server validation messages
  And form submission


  Background:
    Given I am a user on the ck flow
    Given I am on the ck step1 signup page


    #D3F-35
  Scenario: 1 User enters valid information on the email address and password fields
    When I have enter valid "email" value "test@credmo.com"
    And I have enter valid "password" value "asdf1234$RFV"
    And I click element "next-step-button"
    Then I am guided to the ck step2 form page

  Scenario: 2 User without entering a Password selects 'Next Step' Call-to-action
    When I have enter valid "email" value "test@credmo.com"
    And without entering "password"
    And I click element "next-step-button"
    Then I am guided to the ck step1 signup page
    # expected in D3F-35
    Then I shall be displayed an error for the "password" field - "Please create your password."
    # actual  "Please enter a valid password."
    And "password" field label is displayed in red

  Scenario: 3 User without entering an Email Address select 'Next Step' Call-to-action.
    When I have enter valid "password" value "asdf1234$RFV"
    And without entering "email"
    And I click element "next-step-button"
    Then I am guided to the ck step1 signup page
    # expected in D3F-35
    Then I shall be displayed an error for the "email" field - "Please enter a valid email address."
    # actual "Please enter a valid email address."
    And "email" field label is displayed in red

  Scenario: 4 User enters invalid email address
    When I have enter invalid "email" value "invalid@email" that "lacks a TLD"
    #And without entering "password"
    And I click element "next-step-button"
    Then I am guided to the ck step1 signup page
    Then "email" field label is displayed in red
    And I shall be displayed an error for the "email" field - "Please enter a valid email address."
    # actual Please enter a valid email address.

  Scenario: 5 User enters a password that does meet the password criteria.
    When I have enter invalid "password" value "asdf123" that "does not meet the required minimum character length"
    #And without entering "email"
    And I click element "next-step-button"
    Then I am guided to the ck step1 signup page
    And "password" field label is displayed in red
    And "password" field displays X Icon
    Then I shall be displayed an error for the "password" field - "Password must be 8 characters or longer, and contain at least one of each: uppercase letters, lowercase letters, numbers, and symbols !@#$%^&*<>?_"
