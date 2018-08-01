Feature: Step 1 Create your account fields

  As a user I create an account by providing valid email and password
  Covers

  - email
  -- D3F-29 Email Address - Field Validations and Error Handling
  -- D3F-336 Mobile - Email Address - Field Validations and Error Handling


  Background:
    Given I am a user on the ck flow
    Given I am on the ck step1 signup page

  #D3F-29
  Scenario: 1 User enters an email address that meets the required validation criteria.
    When I have enter valid "email" value "tester@credmo.com"
    When I focus on the "password" field
    Then I shall be displayed no errors
    And I shall be displayed no error for the "email" field
#
  Scenario: 2  User without entering an Email Address focuses out of the field.
    When I focus on the "email" field
    And Action detail "however, do not input any value"
    When I focus on the "password" field
    Then I shall be displayed an error for the "email" field - "This is a required field"
    And "email" field label is displayed in red
    And "email" field displays X Icon

  Scenario: 2a User without entering a Email Address focuses out of the field, then returns to enter text
    When I focus on the "email" field
    And Action detail "however, do not input any value"
    When I focus on the "password" field
    When I focus on the "email" field
    And Action detail "however, do not input any value"
    When I focus on the "password" field
    And Action detail "User clicks on the error icon and re-focuses field"
    And I click the X Icon on the "email" field
    Then "email" field does not display X Icon
    #Then I am displayed a "email" tooltip - "Your email address will be used to log in to your account." on desktop only
    And "email" field label is displayed in red
    Then I have enter into "email" field text "x"
    And I shall be displayed no error for the "email" field

  Scenario: 2b - User focuses on the Email Address input field that has an error
    When I focus on the "email" field
    And Action detail "however, do not input any value"
    When I focus on the "password" field
    When I focus on the "email" field
    Then "email" field does not display X Icon
    #Then I am displayed a "email" tooltip - "Your email address will be used to log in to your account." on desktop only
    Then I have enter into "email" field text "@"
    And I shall be displayed no error for the "email" field

  Scenario: 3 User enters invalid email address.
    When I have enter invalid "email" value "userguy" that "does not yet contain @"
    When I focus on the "password" field
    Then I shall be displayed an error for the "email" field - "Please enter a valid email address."
    And "email" field label is displayed in red
    And "email" field displays X Icon

  Scenario: 3a  When the user focuses on the error icon and clicks on it.
    When I have enter invalid "email" value "userguy" that "does not yet contain @"
    When I focus on the "password" field
    Then I shall be displayed an error for the "email" field - "Please enter a valid email address."
    And "email" field label is displayed in red
    And "email" field displays X Icon

    And Action detail "User clicks on the error icon and re-focuses field"
    And I click the X Icon on the "email" field
    Then "email" field does not display X Icon
    #Then I am displayed a "email" tooltip - "Your email address will be used to log in to your account." on desktop only
    And "email" field label is displayed in red
    Then I have enter into "email" field text "."
    And I shall be displayed no error for the "email" field

  Scenario: 3b When the user focuses on the Email Address input field that has the error on it.
    When I have enter invalid "email" value "userguy" that "does not yet contain @"
    When I focus on the "password" field
    Then I shall be displayed an error for the "email" field - "Please enter a valid email address."
    And "email" field label is displayed in red
    And "email" field displays X Icon

    When I focus on the "email" field
    Then "email" field does not display X Icon
    #Then I am displayed a "email" tooltip - "Your email address will be used to log in to your account." on desktop only
    And "email" field label is displayed in red
    Then I have enter into "email" field text "f"
    And I shall be displayed no error for the "email" field

  Scenario: 4 User enters an email address with typo.
    When I have enter invalid "email" value "userguy@gnail.com" that "has a common typo"
    When I focus on the "password" field
    Then I shall be displayed an error for the "email" field - "Oops! It looks like the email address you've entered may contain a typo. Please recheck your email address."
    And "email" field label is displayed in black
    And "email" field displays check Icon

  Scenario Outline: 4 User enters an email address with typo.
    When I have enter invalid "email" value "<email_entered>" that "<type_of_error>"
    When I focus on the "password" field
    Then I shall be displayed an error for the "email" field - "<error_message>"

    Examples:
      | email_entered     | type_of_error      | error_message                                                                                               |
      | userguy@gnail.com | has a common typo  | Oops! It looks like the email address you've entered may contain a typo. Please recheck your email address. |
      | userguy@gmail.co  | has a common typo  | Oops! It looks like the email address you've entered may contain a typo. Please recheck your email address. |
      | userguy.gmail.com | does not contain @ | Please enter a valid email address.                                                                         |
      | userguy.%mail.com | does not contain @ | Please enter a valid email address.                                                                         |
