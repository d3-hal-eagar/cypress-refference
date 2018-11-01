Feature: cfs/landing-fieldValidation-email.feature

  Covers
    -CP-526 Desktop/Mobile - CFS - Landing Page Email Address Field

  Background:
    Given I am a user on the cfs flow
    Given I am on the cfs landing page


#browser behaviour of placeholder text tested in content steps
#  Scenario: 1 Placeholder copy in Email Address Field
#    Then "Email" shall display in the Email Address Field before the user's input
#  Scenario: 2 Re-appearing placeholder copy
#    When I input and then delete characters in the Email Address Field, removing all my input
#    Then "Email" shall re-display in the Email Address Field


  Scenario: 3 Email Address Field Border Glow
    When I click on the "email" field
    And The "email" field border shall have a highlighted focus border

  Scenario: 1 User enters an email address that meets the required validation criteria
    When I have enter valid "email" value "tester@credmo.com"
    And I click element "cta-button"
    Then I shall be displayed no error for the "email" field
    And The "email" field border shall have a default border

  Scenario: 5 - User does not enter a email
    When without entering "email"
    And I click element "cta-button"
    Then The "email" field border is outlined in red color

  Scenario: 5a - User does not enter even focus email field
    When without entering "zip"
    And I click element "cta-button"
    And The "email" field border is outlined in red color

  Scenario: 2b - User corrects invalid Email Address input field that has an error
    When without entering "email"
    And I click element "cta-button"
    And The "email" field border is outlined in red color
    And I enter additional text into "email" field text "me@example.com"
    And I focus on the "zip" field
    And I shall be displayed no error for the "email" field
    Then The "email" field border shall have a default border
    And I click element "cta-button"
    Then The "email" field border shall have a default border

  Scenario: 3 User enters invalid email address
    When I have enter invalid "email" value "userguy" that "does not yet contain @"
    Then The "email" field border shall have a default border
    And I click element "cta-button"
    And The "email" field border is outlined in red color

    # additional rules correctly enforced localpart@label.tld
    # *label* can only be 63
    # *localpart* can only be 64 characters
  Scenario: 5 - System restricts user from entering more than 27 characters in the City input field.
    And I click element "cta-button"
    When I have enter valid "email" value "12345678901234567890123456789012345678901234567809123@seventyfive.limit"
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

  Scenario: User enters invalid characters in email multiple input errors
    When I have enter invalid characters "![]&@%?<>!$():;~^{}+=|*ãü木✉" into valid input "me@you.com" on the "email" and I see validation error message "Please enter a valid email address."
# note @ is included here because an email can contain only 1 @
# in actual fact many of these characters are allowed in the "local-part" but not domain
# in some cases even the unicode characters could be in the domain
  Scenario: User enters additional invalid characters in email multiple input errors
    When I have enter invalid characters "',#_\/\\\"" into valid input "me@you.com" on the "email" and I see validation error message "Please enter a valid email address."
