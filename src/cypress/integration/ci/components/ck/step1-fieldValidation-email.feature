Feature: Step 1 Create your account fields Email Addres

  As a user I create an account by providing valid email and password
  Covers
    - D3F-29 Email Address - Field Validations and Error Handling
    - D3F-336 Mobile - Email Address - Field Validations and Error Handling


  Background:
    Given I am a user on the ck flow
    Given I am on the ck step1 signup page


  #D3F-29
  Scenario: 2a User without entering a Email Address focuses out of the field, then returns to enter text
    When without entering "email"
    And I blur the "email" field
    #And I click the X Icon on the "email" field
    And I click the label on the "email" field
    Then "email" field does not display X Icon
    And Check that the "email" field is focused
    And "email" field label is displayed in red
    Then I enter additional text into "email" field text "x"
    And I shall be displayed no error for the "email" field

  Scenario: 1 User enters an email address that meets the required validation criteria
    When I have enter valid "email" value "tester@credmo.com"
    Then I shall be displayed no error for the "email" field
#
  Scenario: 2  User without entering an Email Address focuses out of the field
    When without entering "email"
    Then I shall be displayed an error for the "email" field - "This is a required field"
    And "email" field label is displayed in red
    And "email" field displays X Icon

  Scenario: 2b - User focuses on the Email Address input field that has an error
    When without entering "email"
    Then "email" field does not display X Icon
    And I enter additional text into "email" field text "@"
    And I shall be displayed no error for the "email" field

  Scenario: 3 User enters invalid email address
    When I have enter invalid "email" value "userguy" that "does not yet contain @"
    Then I shall be displayed an error for the "email" field - "Please enter a valid email address."
    And "email" field label is displayed in red
    And "email" field displays X Icon

  Scenario: 3a  When the user focuses on the error icon and clicks on it
    When I have enter invalid "email" value "userguy" that "does not yet contain @"
    Then I shall be displayed an error for the "email" field - "Please enter a valid email address."
    And "email" field label is displayed in red
    And "email" field displays X Icon
    #And I click the X Icon on the "email" field
    And I click the label on the "email" field
    Then "email" field does not display X Icon
    And Check that the "email" field is focused
    And "email" field label is displayed in red
    Then I enter additional text into "email" field text "."
    And I shall be displayed no error for the "email" field

  Scenario: 3b When the user focuses on the Email Address input field that has the error on it
    When I have enter invalid "email" value "userguy" that "does not yet contain @"
    Then I shall be displayed an error for the "email" field - "Please enter a valid email address."
    And "email" field label is displayed in red
    And "email" field displays X Icon

    When I click on the "email" field
    Then "email" field does not display X Icon
    And "email" field label is displayed in red
    When I enter additional text into "email" field text "f"
    Then I shall be displayed no error for the "email" field

  Scenario: 4 User enters an email address with typo
    When I have enter invalid "email" value "userguy@gnail.com" that "has a common typo"
    Then I shall be displayed an error for the "email" field - "Oops! It looks like the email address you've entered may contain a typo. Please recheck your email address."
    And "email" field label is displayed in black
    And "email" field displays check Icon

  Scenario Outline: User enters an valid email
    When I have enter valid "email" value "<email_entered>"
    And I shall be displayed no error for the "email" field

    Examples:
      | email_entered       |
      | hal@haleagar.com    |
      | info@example.com    |
      | a@be.com            |
      | hal@toys.cc         |
      | hal.e@toys.net      |
      | Unfo@example.com    |
      | info@Example.com    |
      | one@number2.com     |
      | jane387@hotmail.com |

  Scenario Outline: User enters an invalid email
    When I have enter invalid "email" value "<email_entered>" that "<type_of_error>"
    Then I shall be displayed an error for the "email" field - "<error_message>"

    Examples:
      | email_entered        | type_of_error      | error_message                                                                                               |
      | userguy@gnail.com    | has a common typo  | Oops! It looks like the email address you've entered may contain a typo. Please recheck your email address. |
      | userguy@gmail.co     | has a common typo  | Oops! It looks like the email address you've entered may contain a typo. Please recheck your email address. |
      | userguy@gmail..com   | double dot         | Please enter a valid email address.                                                                         |
      | .userguy@gmail.com   | stars with dot     | Please enter a valid email address.                                                                         |
      | userguy.gmail.com    | does not contain @ | Please enter a valid email address.                                                                         |

  Scenario: User enters invalid characters in email multiple input errors
    When I have enter invalid characters "![]&@%?<>!$():;~^{}+=|_*ãü木✉" into valid input "me@you.com" on the "email" and I see validation error message "Please enter a valid email address."

  Scenario: User enters additional invalid characters in email multiple input errors
    When I have enter invalid characters ",#\//\"'" into valid input "me@you.com" on the "email" and I see validation error message "Please enter a valid email address."
