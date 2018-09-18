Feature: Phone Number - Validation Criteria and Error Handling

  Covers
  - CP-820 Desktop - EX - Step 1 Page - Phone Number - Validation Criteria and Error Handling
  Validation Criteria
  - Maximum of 10 numbers
  - Minimum of 10 numbers
  - First number cannot be 1
  - First number cannot be 0
  - all non-numeric characters removed from fields when entered including ()-. space


  Background: user on Step 1 acquisition flow screen
    Given I am a user on the ex flow
    Given I am on the ex step1 signup page


  Scenario: 1 - System restricts the user to enter a maximum of 10 characters
    When I have enter valid "phone" value "2345678901"
    Then I shall be displayed no error for the "phone" field
    And I enter additional text into "phone" field text "123"
    And I am restricted from entering more than "10" characters in "phone" field

  Scenario: 1a - System restricts the user to enter a non-numeric characters
    When I have enter invalid "phone" value "test2345678901 -!@#$%^&*()_+=~{}[]:";'>?/.<,|\" that "has a non-numeric characters"
    Then I shall be displayed no error for the "phone" field

  Scenario: 2 - User without entering Phone Number focuses out of input field.
    When without entering "phone"
    Then "phone" field displays warning Icon
    And The "phone" field border is outlined in red color

  Scenario: 2a - User focuses back on the Phone Number field that has the warning Icon
    When without entering "phone"
    And I focus on the "phone" field
    Then I shall be displayed an error for the "phone" field - "Please enter a valid phone number."
    When I have enter valid "phone" value "2345678901"
    And "phone" field displays green colored check mark Icon
    And "phone" input field shall be outlined in green

  Scenario: 3 - User enters an invalid Phone Number.
    When I have enter invalid "phone" value "232234523" that "has less than 10 digits"
    Then "phone" field displays warning Icon
    And The "phone" field border is outlined in red color

  Scenario: 3a - User focuses back on the Phone Number field that has the warning icon
    When I have enter invalid "phone" value "232234523" that "has less than 10 digits"
    Then I shall be displayed an error for the "phone" field - "Please enter a valid phone number."
    And "phone" field displays warning Icon
    And The "phone" field border is outlined in red color
    When I have enter valid "phone" value "2345678901"
    And "phone" field displays green colored check mark Icon
    And "phone" input field shall be outlined in green

  Scenario: 3b - User enters an invalid Phone Number that has first number as '1'.
    When I have enter invalid "phone" value "1234567890" that "has first number'1'"
    Then "phone" field displays warning Icon
    And The "phone" field border is outlined in red color
    And I shall be displayed an error for the "phone" field - "Please enter a valid phone number."

  Scenario: 3c - User enters an invalid Phone Number that has first number as '0'.
    When I have enter invalid "phone" value "0234567891" that "has first number'0'"
    Then "phone" field displays warning Icon
    And The "phone" field border is outlined in red color
    And I shall be displayed an error for the "phone" field - "Please enter a valid phone number."

  Scenario: user enters common formated phone number
    When I have enter invalid "phone" value "(646) 555-5555" that "has a non-numeric characters"
    Then I shall be displayed no error for the "phone" field

  Scenario: users form autofill enters common formated phone number with area code
    When I have enter invalid "phone" value "1 (646) 555-5555" that "has first number'1'"
    Then "phone" field displays warning Icon
    And The "phone" field border is outlined in red color
    And I shall be displayed an error for the "phone" field - "Please enter a valid phone number."

  Scenario: users form autofill enters common formated phone number with international area code
    When I have enter invalid "phone" value "+01 (646) 555-5555" that "has first number'1'"
    Then "phone" field displays warning Icon
    And The "phone" field border is outlined in red color
    And I shall be displayed an error for the "phone" field - "Please enter a valid phone number."
