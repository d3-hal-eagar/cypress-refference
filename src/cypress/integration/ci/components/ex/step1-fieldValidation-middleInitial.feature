Feature: Middle Initial - Validation Criteria and Error Handling

  Covers
    - CP-713 (D3F-431) Middle Initial - Validation Criteria and Error Handling
    - CP-827 (D3F-816) EX/Signup: Remove the checkmark for apartment, middle initial, and suffix if no characters are entered on blur
  Validation Criteria
    - Not a required field.
    - Pattern - "^([A-Za-z]+)$"
    - Middle Initial may only contain 1 letter.


  Background:
    Given I am a user on the ex flow
    Given I am on the ex step1 signup page


  Scenario: 1 - User enters Initial
    When I have enter valid "middleInitial" value "A"
    Then The "middleInitial" field border is displayed in green
    And A green checkmark inside the "middleInitial" field is displayed
    And I shall be displayed no error for the "middleInitial" field

  Scenario: 2 - User does not enter any character in Middle Initial input field
    When without entering "middleInitial"
    Then I shall not be displayed any errors or validation markup on non required field "middleInitial"
    And I shall be displayed no error for the "middleInitial" field

#  Validation scenarios for invalid Middle Initial in Step 1 of Experian Acquisition Flow.
#   Middle Initial input field can contain only 1 alpha character

  Scenario: 3 - User enters invalid Middle Initial input field - digits
        # While entering an invalid Middle Initial - using characters other than - alphabet
    When I have enter invalid "middleInitial" value "1" that "other than - alphabet"
    Then I shall be displayed an error for the "middleInitial" field - "Middle Initial may only be letters."
    And The "middleInitial" field border is outlined in red color
    And A red warning icon inside the "middleInitial" field is displayed

  Scenario: 3a - User enters invalid Middle Initial input field - symbols
        # While entering an invalid Middle Initial - using characters other than - alphabet
    When I have enter invalid "middleInitial" value "&" that "other than - alphabet"
    Then I shall be displayed an error for the "middleInitial" field - "Middle Initial may only be letters."
    And The "middleInitial" field border is outlined in red color
    And A red warning icon inside the "middleInitial" field is displayed

  Scenario: 3b - User focuses on the input field that is outlined in red and than enters invalid data again
    When I have enter invalid "middleInitial" value "=" that "other than - alphabet"
    Then I shall be displayed an error for the "middleInitial" field - "Middle Initial may only be letters."
    When I have enter invalid "middleInitial" value "4" that "other than - alphabet"
    Then I shall be displayed an error for the "middleInitial" field - "Middle Initial may only be letters."
    And The "middleInitial" field border is outlined in red color
    And A red warning icon inside the "middleInitial" field is displayed

  Scenario: 3c - User focuses on the input field that is outlined in red and than enters valid data
    When I have enter invalid "middleInitial" value "%" that "other than - alphabet"
    Then I shall be displayed an error for the "middleInitial" field - "Middle Initial may only be letters."
    When I have enter valid "middleInitial" value "Z"
    Then The "middleInitial" field border is displayed in green
    And A green checkmark inside the "middleInitial" field is displayed

  Scenario: 3d - Middle initial length limited to 1 character
    When I have enter invalid "middleInitial" value "Ba" that "contain more than 1 letter"
    #Then I shall be displayed an error for the "middleInitial" field - "Middle Initial may only be letters."
    Then I am restricted from entering more than "1" characters in "middleInitial" field

  Scenario: 3b - User focuses on the input field that is outlined in red and than enters valid data
    When I have enter invalid "middleInitial" value "=" that "other than - alphabet"
    Then I shall be displayed an error for the "middleInitial" field - "Middle Initial may only be letters."
    When I have enter valid "middleInitial" value "A"
    Then The "middleInitial" field border is displayed in green
    And A green checkmark inside the "middleInitial" field is displayed
    And I shall be displayed no error for the "middleInitial" field

  # performance optimized multi value test
  Scenario: User enters invalid characters in Middle initial multiple input errors
    When I have enter invalid characters "![]&@%?<>!$():;~^{}+=|*ãü木✉" into valid input "D" on the "middleInitial" and I see validation error message "Middle Initial may only be letters."

  Scenario: User enters additional invalid characters in Middle initial multiple input errors
    When I have enter invalid characters "' .,#_\/\\\"" into valid input "D" on the "middleInitial" and I see validation error message "Middle Initial may only be letters."
