Feature: Step 1 Create your account fields Email Addres

  As a user I create an account by providing valid email and password
  Covers
    - CP-815 (D3F-29) Email Address - Field Validations and Error Handling
    - CP-86 (D3F-336) Mobile - Email Address - Field Validations and Error Handling


  Background:
    Given I am a user on the ck flow
    Given I am on the ck step1 signup page


   #D3F-29
  Scenario: 2a User without entering a Email Address focuses out of the field, then returns to enter text
    When without entering "email"
    And I blur the "email" field
    #And I click the X Icon on the "email" field
    And I click the label on the "email" field
    And Check that the "email" field is focused
    # this test is funky and needs to be forced to trigger but manual testing shows it's fine
    Then I blur the "email" field
    Then I click on the "email" field
    Then "email" field does not display X Icon
    And "email" field label is displayed in red
    Then I enter additional text into "email" field text "x"
    And I shall be displayed no error for the "email" field

  Scenario: 1 User enters an email address that meets the required validation criteria
    When I have enter valid "email" value "tester@credmo.com"
    Then I shall be displayed no error for the "email" field
    Then I blur the "email" field
    And "email" field displays check Icon
#
  Scenario: 2  User without entering an Email Address focuses out of the field
    When without entering "email"
    Then I shall be displayed an error for the "email" field - "Please enter a valid email address."
    And "email" field label is displayed in red
    And "email" field displays X Icon

  Scenario: 2b - User focuses on the Email Address input field that has an error
    When without entering "email"
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
    And Check that the "email" field is focused
    Then I click on the "email" field
    Then "email" field does not display X Icon
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

    # additional rules correctly enforced localpart@label.tld
    # *label* can only be 63
    # *localpart* can only be 64 characters
  Scenario: 5 - System restricts user from entering more than 27 characters in the City input field.
    When I have enter valid "email" value "12345678901234567890123456789012345678901234567809123@seventyfive.limit"
    Then I shall be displayed no error for the "email" field
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
      | userguy@gnail.com    | has a common typo  | Oops! It looks like the email address you've entered may contain a typo. Please recheck your email address. |
      | userguy@gmail.co     | has a common typo  | Oops! It looks like the email address you've entered may contain a typo. Please recheck your email address. |
      | userguy@gmail..com   | double dot         | Please enter a valid email address.                                                                         |
      | .userguy@gmail.com   | stars with dot     | Please enter a valid email address.                                                                         |
      | userguy.gmail.com    | does not contain @ | Please enter a valid email address.                                                                         |

  Scenario: User enters invalid characters in email multiple input errors
    When I have enter invalid characters "![]&@%?<>!$():;~^{}+=|*ãü木✉" into valid input "me@you.com" on the "email" and I see validation error message "Please enter a valid email address."
# note @ is included here because an email can contain only 1 @
# in actual fact many of these characters are allowed in the "local-part" but not domain
# in some cases even the unicode characters could be in the domain
  Scenario: User enters additional invalid characters in email multiple input errors
    When I have enter invalid characters "',#_\/\\\"" into valid input "me@you.com" on the "email" and I see validation error message "Please enter a valid email address."
