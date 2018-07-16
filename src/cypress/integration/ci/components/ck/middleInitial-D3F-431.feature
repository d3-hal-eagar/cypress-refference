Feature: Middle Initial - Validation Criteria and Error Handling

  Validation Criteria:
    - Not a required field.
    - Pattern - "^([A-Za-z]+)$"
    - Middle Initial may only contain 1 letter.

  Scenario: User enters Initial
    Given: I am a user on ex flow
    When: I am on Step 1 ex flow
    And: I enter an Initial 1 character
    And: I focus out of the Middle Initial input field
    Then: System shall run a validation
    And: Outline the input field in green
    And: Display a green checkmark inside the field

  Scenario: User does not enter any character in Middle Initial input field
    Given: I am a user on ex flow
    When: I am on Step 1 ex flow
    And: I do not enter any character in Middle Initial input field
    And: I focus out of the Middle Initial input field
    Then: System shall run a validation
    And: Shall display no errors as it is not a required field

#  Validation scenarios for invalid Middle Initial in Step 1 of Experian Acquisition Flow.
#   Middle Initial input field can contain only 1 alpha character

  Scenario: User enters invalid Middle Initial input field
    Given: I am a user on ex flow
    When: I am on Step 1 ex flow
    And: While entering an invalid Middle Initial - using characters other than - alphabet
    Then: I shall be displayed an error - "Your middle initial may only contain letters." in red tooltip
    And: The field is outlined in red color
    And: Shall display a red warning icon inside the field

  Scenario: - User focuses on the input field that is outlined in red
    Given: I am a user on ex flow
    When: I am on Step 1 ex flow
    And: I focus on the input field outlined in red color
    Then: Cursor is black in color and the error message is displayed -"Your middle initial may only contain letters."
    When: On entering an alphabet character in the field.

#  If the entered middle initial is correct the field is outlined in green color and a checkmark appears inside the field.
#  If the entered character is not valid then the field remains outlined in red, with the error mesg displayed and the error icon inside the field.
