Feature: cfs/step1-fieldValidation-email.feature

  Covers
    -CP-526 Desktop/Mobile - CFS - Landing Page Email Address Field
    #todo - not allow press/hold any keyboard character to repeatedly input a character

  Background:
    Given I am a user on the cfs flow
    Given I am on the cfs step1 page


#browser behaviour of placeholder text tested in content steps
#  Scenario: 1 Placeholder copy in Email Address Field
#    Then "Email" shall display in the Email Address Field before the user's input
#  Scenario: 2 Re-appearing placeholder copy
#    When I input and then delete characters in the Email Address Field, removing all my input
#    Then "Email" shall re-display in the Email Address Field


  Scenario: 3 Email Address Field Border Glow
    When I click on the "firstName" field
    And The "email" field border shall have a highlighted focus border

  Scenario: 1 User enters an email address that meets the required validation criteria
    When I have enter valid "email" value "tester@credmo.com"
    Then I shall be displayed no error for the "email" field
    Then The "firstName" field border shall have a default border
#
#  No error state for empty required fields in cfs
#  Scenario: 2  User without entering an Email Address focuses out of the field
#    When without entering "email"
#    Then I shall be displayed an error for the "email" field - "Please enter a valid email address."

  Scenario: 2b - User focuses on the Email Address input field that has an error
    When without entering "email"
    And I enter additional text into "email" field text "@"
    And I shall be displayed no error for the "email" field
    Then The "firstName" field border shall have a default border

  Scenario: 3 User enters invalid email address
    When I have enter invalid "email" value "userguy" that "does not yet contain @"
    And The "email" field border is outlined in red color
    And I click on the "cta-button" element
    Then I shall be displayed an error for the "email" field - "Please enter a valid email address."

  Scenario: 3a When the user focuses on the Email Address input field that has the error on it
    When I have enter invalid "email" value "userguy" that "does not yet contain @"
    #Then I shall be displayed an error for the "email" field - "Please enter a valid email address."
    And The "email" field border is outlined in red color
    When I enter additional text into "email" field text "f"
    Then I shall be displayed no error for the "email" field
    Then The "firstName" field border shall have a default border

#  Scenario: 4 User enters an email address with typo
#    When I have enter invalid "email" value "userguy@gnail.com" that "has a common typo"
#    Then I shall be displayed an error for the "email" field - "Oops! It looks like the email address you've entered may contain a typo. Please recheck your email address."

    # additional rules correctly enforced localpart@label.tld
    # *label* can only be 63
    # *localpart* can only be 64 characters
  Scenario: 5 - System restricts user from entering more than 27 characters in the City input field.
    When I have enter valid "email" value "12345678901234567890123456789012345678901234567809123@seventyfive.limit"
    Then I shall be displayed no error for the "email" field
    Then The "firstName" field border shall have a default border
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
      | .userguy@gmail.com   | starts with dot     | Please enter a valid email address.                                                                         |
      | userguy.gmail.com    | does not contain @ | Please enter a valid email address.                                                                         |

  Scenario: User enters invalid characters in email multiple input errors
    When I have enter invalid characters "![]&@%?<>!$():;~^{}+=|*ãü木✉" into valid input "me@you.com" on the "email" and I see validation error message "Please enter a valid email address."
# note @ is included here because an email can contain only 1 @
# in actual fact many of these characters are allowed in the "local-part" but not domain
# in some cases even the unicode characters could be in the domain
  Scenario: User enters additional invalid characters in email multiple input errors
    When I have enter invalid characters "',#_\/\\\"" into valid input "me@you.com" on the "email" and I see validation error message "Please enter a valid email address."
