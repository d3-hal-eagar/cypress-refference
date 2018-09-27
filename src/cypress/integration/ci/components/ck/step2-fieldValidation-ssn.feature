Feature: ck/step2-fieldValidation-ssn.feature

  Covers:
  CP-769 - Social Security Number - Validation Criteria & Error Handling
  CP-788 - Mobile - Social Security Number - Validation Criteria & Error Handling

  Validation Rules:
  - Required field.
  - 3 input fields with 3, 2 and 4 digits in length

  Background: user on Step 2 acquisition flow screen
    Given I am a user on the ck flow
    When I am on the ck step2 form page


  Scenario: 1 - Default view of the SSN field
    Then I shall be displayed the "ssn1", "ssn2" and "ssn" fields in the XXX-XX-___ format

  Scenario: 2 - As a user when I enter four digits in the SSN Last password field, the system shall mask the SSN digits as entered, behind bullets.
    And I have enter valid "ssn" value "1234"
    Then "ssn" field has masked characters

  Scenario: 3 - User enters last 4 digits of SSN
    And I have enter valid "ssn" value "1234"
    Then I shall be displayed no error for the "ssn" field

  Scenario: 4 - System restricts the user from entering more than 4 digits in the 'last 4 digits of SSN' field.
    When I have enter invalid "ssn" value "1234567890" that "has more than 4 digits"
    Then I am restricted from entering more than "4" characters in "ssn" field

  Scenario: 5a - User enters symbol other than digits on SSN Input field.
    And I have enter invalid "ssn" value "123k" that "has symbol other than digits"
    And "ssn-label" field label is displayed in red
    And I shall be displayed an error for the "ssn" field - "Please enter the last 4 digits." in red

  Scenario: 5b - User enters less than 4 digits on SSN Input field.
    And I have enter invalid "ssn" value "123" that "has less then 4 digits"
    And "ssn-label" field label is displayed in red
    And I shall be displayed an error for the "ssn" field - "Please enter the last 4 digits." in red

  Scenario: 5c - User focuses back on SSN Input field that has the error message -"Please enter the last 4 digits."
    And I have enter invalid "ssn" value "123" that "has less then 4 digits"
    Then "ssn-label" field label is displayed in red
    And I shall be displayed an error for the "ssn" field - "Please enter the last 4 digits." in red
    And I have enter valid "ssn" value "7865"
    Then I shall be displayed no error for the "ssn" field
    And "ssn" field label is displayed in black
    And "ssn" input field shall be black

# unique placement of validation message means this step not valid for ssn
#  Scenario: User enters invalid characters in SSN code multiple input errors
#    When I have enter invalid characters "![]&@%?<>!$():;~^{}+=|*ãü木✉" into valid input "1234" on the "ssn" and I see validation error message "Please enter the last 4 digits."
#
#  Scenario: User enters additional invalid characters in SSN code multiple input errors
#    When I have enter invalid characters ".' ,#_\/\\\"" into valid input "1234" on the "ssn" and I see validation error message "Please enter the last 4 digits."

    #todo without entering ssn
    #todo all tests for full ssn   "Please enter your street address."
