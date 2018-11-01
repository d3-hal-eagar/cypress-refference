Feature: cfs/step2-fieldValidation-email.feature

  Covers
    - CP-507 Desktop/Mobile - CFS - Step 2 Page - Create Account

  Background:
    Given I am a user on the cfs flow
    Given I am on the cfs step2 page


  Scenario: Email Address Field Border Glow
    When I click on the "email" field
    And The "email" field border shall have a highlighted focus border

  Scenario: 1 User enters an email address that meets the required validation criteria
    When I have enter valid "email" value "tester@credmo.com"
    And I click element "cta-button"
    Then I shall be displayed no error for the "email" field
    Then The "email" field border shall have a default border

  Scenario: 2b - User corrects the Email Address input field that has an error
    When without entering "email"
    And I click element "cta-button"
    #CP-327 #Then I shall be displayed an error for the "email" field - "Please enter your email address." in red
    Then I shall be displayed an error for the "email" field - "Please enter a valid email address." in red
    And I enter additional text into "email" field text "a@be.cc"
    Then I blur the "email" field
    And I shall be displayed no error for the "email" field
    Then The "email" field border shall have a default border

  Scenario: 3 User enters invalid email address
    When I have enter invalid "email" value "userguy" that "does not yet contain @"
    And I click element "cta-button"
    And The "email" field border is outlined in red color
    #CP-327 Then I shall be displayed an error for the "email" field - "Invalid email address" in red
    Then I shall be displayed an error for the "email" field - "Please enter a valid email address." in red

  Scenario: 3a When the user corrects the Email Address input field that has the error on it
    When I have enter invalid "email" value "them" that "does not yet contain @"
    And I click element "cta-button"
    #CP-327 Then I shall be displayed an error for the "email" field - "Invalid email address" in red
    Then I shall be displayed an error for the "email" field - "Please enter a valid email address." in red
    And The "email" field border is outlined in red color
    When I enter additional text into "email" field text "@or.us"
    Then I blur the "email" field
    Then I shall be displayed no error for the "email" field
    Then The "email" field border shall have a default border

    # additional rules correctly enforced localpart@label.tld
    # *label* can only be 63
    # *localpart* can only be 64 characters
  Scenario: 5 - System restricts user from entering more than 27 characters in the City input field.
    When I have enter valid "email" value "12345678901234567890123456789012345678901234567809123@seventyfive.limit"
    Then I blur the "email" field
    Then I shall be displayed no error for the "email" field
    Then The "email" field border shall have a default border
    And I enter additional text into "email" field text ".comando"
    And I am restricted from entering more than "75" characters in "email" field

  Scenario: User enters an valid email
    When I have enter valid "email" value I do not see the validation error message
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

  Scenario: User enters an invalid email
    When I have enter invalid "email" value I see the correct validation error message
      | email_entered        | type_of_error      | error_message                                                                                               |
      | userguy@gmail..com   | double dot         | Please enter a valid email address.                                                                         |
      | .userguy@gmail.com   | starts with dot    | Please enter a valid email address.                                                                         |
      | userguy.gmail.com    | does not contain @ | Please enter a valid email address.                                                                         |

  Scenario: User enters invalid characters in email multiple input errors
    When I have enter invalid characters "![]&@%?<>!$():;~^{}+=|*ãü木✉" into valid input "me@you.com" on the "email" and I see validation error message "Please enter a valid email address."
# note @ is included here because an email can contain only 1 @
# in actual fact many of these characters are allowed in the "local-part" but not domain
# in some cases even the unicode characters could be in the domain
  Scenario: User enters additional invalid characters in email multiple input errors
    When I have enter invalid characters "',#_\/\\\"" into valid input "me@you.com" on the "email" and I see validation error message "Please enter a valid email address."
