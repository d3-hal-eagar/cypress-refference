Feature: Social Security Number - Validation Criteria & Error Handling

  Covers:
  CP-499 - Desktop - EX - Social Security Number - Validation Criteria & Error Handling

  Validation Rules:
  - Required field.
  - Numbers only.
  - Maximum of 4 numbers.
  - Minimum of 4 numbers.

  Background: user on Step 2 acquisition flow in Experian
    Given I am a user on the ex flow
    When I am on the ex step2 form page


  Scenario: 1 - Default view of the SSN field
    Then I shall be displayed the "ssn" ssn-input field
    And The "<label[for=ssn]" field label is "Last 4 Digits of your Social Security Number"

  Scenario: 2 - As a user when I enter digits on 'Last 4 of SSN' field, the system shall mask the SSN digits as entered, behind bullets.
    And I have enter valid "ssn" value "1234"
    Then "ssn" field has masked characters

  Scenario: 3 - As a user when I select the checkbox - Display
    And Check that the "ssn-display-checkbox" field is not checked
    And "ssn" field has masked characters
    And I select the checkbox on "ssn-display-checkbox" field element
    Then Check that the "ssn-display-checkbox" field is checked
    And "ssn" field displays as plain text
    When I unselect the checkbox on "ssn-display-checkbox" field element
    Then Check that the "ssn-display-checkbox" field is not checked
    And "ssn" field has masked characters

  Scenario: 4 - User enters last 4 digits of SSN
    And I have enter valid "ssn" value "1234"
    Then I shall be displayed no error for the "ssn" field
    And "ssn" field displays green colored check mark Icon
    And "ssn" input field shall be outlined in green

  Scenario: 5 - System restricts the user from entering 4 digits on the 'last 4 digits of SSN' field.
    And I have enter invalid "ssn" value "1234567890" that "has more than 4 digits"
    Then I am restricted from entering more than "4" characters in "ssn" field

  Scenario: 6 - User enters symbol other than digits on SSN Input field.
    And I have enter invalid "ssn" value "12fd" that "has symbol other than digits"
    Then I shall be displayed an error for the "ssn" field - "Please enter the last 4 digits." in red
    And "ssn" field displays warning Icon
    And The "ssn" field border is outlined in red color

  Scenario: 7 - User enters less than 4 digits on SSN Input field.
    And I have enter invalid "ssn" value "123" that "has less then 4 digits"
    Then I shall be displayed an error for the "ssn" field - "Please enter the last 4 digits." in red
    And "ssn" field displays warning Icon
    And The "ssn" field border is outlined in red color

  Scenario: 8 - User focuses back on SSN Input field that has the error message -"Please enter valid SSN."
    And I have enter invalid "ssn" value "123" that "has less then 4 digits"
    Then I shall be displayed an error for the "ssn" field - "Please enter the last 4 digits." in red
    When I have enter valid "ssn" value "7865"
    Then I shall be displayed no error for the "ssn" field
    And "ssn" field displays green colored check mark Icon
    And "ssn" input field shall be outlined in green

  Scenario: 9 - User enters invalid characters in SSN code multiple input errors
    When I have enter invalid characters "![]&@%?<>!$():;~^{}+=|_*ãü木✉" into valid input "1234" on the "ssn" and I see validation error message "Please enter the last 4 digits."

  Scenario: 10 - User enters additional invalid characters in SSN code multiple input errors
    When I have enter invalid characters ".,#'\//\" " into valid input "1234" on the "ssn" and I see validation error message "Please enter the last 4 digits."

  Scenario: 11 - User without entering SSN focuses out of field.
    When without entering "ssn"
    Then "ssn" field displays warning Icon
    And I shall be displayed an error for the "ssn" field - "Please enter the last 4 digits." in red
    And The "ssn" field border is outlined in red color
