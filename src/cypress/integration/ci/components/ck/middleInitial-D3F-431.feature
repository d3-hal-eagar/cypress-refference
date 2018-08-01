Feature: Middle Initial - Validation Criteria and Error Handling

  Covers D3F-431
  --------------------
  Validation Criteria:
    - Not a required field.
    - Pattern - "^([A-Za-z]+)$"
    - Middle Initial may only contain 1 letter.

  Background:
    Given I am a user on the ex flow
    Given I am on the ex step1 signup page

  Scenario: 1 - User enters Initial

    When I have enter valid "middleInitial" value "A"
    And I focus on the "step2" field
    Then The "middleInitial" field border is displayed in green
    And A green checkmark inside the "middleInitial" field is displayed

  Scenario: 2 - User does not enter any character in Middle Initial input field
    When I focus on the "middleInitial" field
        # I do not enter any character in Middle Initial input field
        # I focus out of the Middle Initial input field
    And I focus on the "step2" field
        # System shall run a validation
    Then Shall display no errors as "middleInitial" is not a required field

#  Validation scenarios for invalid Middle Initial in Step 1 of Experian Acquisition Flow.
#   Middle Initial input field can contain only 1 alpha character

  Scenario: 3 - User enters invalid Middle Initial input field - digits
        # While entering an invalid Middle Initial - using characters other than - alphabet
    When I have enter invalid "middleInitial" value "1" that "other than - alphabet"
    Then I shall be displayed an error for the "middleInitial" field - "Your middle initial may only contain letters."
    And The "middleInitial" field border is outlined in red color
    And A red warning icon inside the "middleInitial" field is displayed

  Scenario: 3a - User enters invalid Middle Initial input field - symbols
        # While entering an invalid Middle Initial - using characters other than - alphabet
    When I have enter invalid "middleInitial" value "&" that "other than - alphabet"
    Then I shall be displayed an error for the "middleInitial" field - "Your middle initial may only contain letters."
    And The "middleInitial" field border is outlined in red color
    And A red warning icon inside the "middleInitial" field is displayed

  Scenario: 3b - User focuses on the input field that is outlined in red and than enters invalid data again
    When I have enter invalid "middleInitial" value "=" that "other than - alphabet"
    And I focus on the "step2" field
    And I focus on the "middleInitial" field
    Then I shall be displayed an error for the "middleInitial" field - "Your middle initial may only contain letters."
    When I have enter invalid "middleInitial" value "Ba" that "contain more than 1 letter"
    Then I shall be displayed an error for the "middleInitial" field - "Your middle initial may only contain letters."
    And The "middleInitial" field border is outlined in red color
    And A red warning icon inside the "middleInitial" field is displayed

  Scenario: 3c - User focuses on the input field that is outlined in red and than enters valid data
    When I have enter invalid "middleInitial" value "%" that "other than - alphabet"
    And I focus on the "step2" field
    And I focus on the "middleInitial" field
    Then I shall be displayed an error for the "middleInitial" field - "Your middle initial may only contain letters."
    When I have enter valid "middleInitial" value "Z"
    Then The "middleInitial" field border is displayed in green
    And A green checkmark inside the "middleInitial" field is displayed