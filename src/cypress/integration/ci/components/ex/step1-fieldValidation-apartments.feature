Feature: Apartment - Validation Criteria & Error Handling

  Covers
    - CP-824 Desktop - EX - Step 1 Page - Apt, Unit, Bldg, Suite - Validation Criteria & Error Handling
    - CP-836 (D3F-820) City field: Make it so that you can include apostrophes in the validation rules. Also apply this to street address, city, and name.
  Validation Criteria
    - Not a required field.
    - Max length of 5 characters


  Background: user on Step 1 acquisition flow screen
    Given I am a user on the ex flow
    Given I am on the ex step1 signup page


  Scenario: 1 - User enters valid Apartment
    When I have enter valid "street2" value "S56"
    Then I shall be displayed no error for the "street2" field
    And "street2" field does not display warning Icon
    And "street2" field displays check Icon
    And "street2" input field shall be outlined in green

  Scenario: 2 - User does not enter any characters in Apartment input field
    And without entering "street2"
    Then I shall be displayed no error for the "street2" field

  Scenario: 3 - System restricts the user to enter a maximum of five characters
    When I have enter valid "street2" value "12345678901234567890123456789012345678901234567890123456789012345678901234567890 Address street"
    And I shall be displayed no error for the "street2" field
    Then I enter additional text into "street2" field text " 7890123"
    Then I am restricted from entering more than "100" characters in "street2" field

#    removed as illogical for non required field
#  Scenario: 3a - Must be at least 2 characters in length.
#    When I have enter invalid "street2" value "1" that "too short"
#    Then I shall be displayed an error for the "street2" field - "Please enter valid address format." in red

  Scenario: 4b - User focuses on the Apartment input field that has the error
    And I have enter invalid "street2" value "22%n" that "has an '% symbol"
    And I shall be displayed an error for the "street2" field - "Please enter valid address format." in red
    When I have enter valid "street2" value "22A"
    Then "street2" field does not display warning Icon
    And "street2" field displays check Icon
    And "street2" input field shall be outlined in green
    And I shall be displayed no error for the "street2" field

  Scenario Outline: 5 User enters valid Apartment
    When I have enter a valid "street2" value "<apartment_entered>" that "<testing_character>"
    Then I shall be displayed no error for the "street2" field

    Examples:
      | apartment_entered | testing_character   |
      | 22,b              | has a comma         |
      | #11               | has a number signs  |
      | 22-A              | has a hyphen (-)    |
      | Suite 1103        | has a space         |
      | 22.1              | has a period        |
      | 22A/B             | has a forward slash |
      | 22A'B             | has a single quote  |

  Scenario: User enters invalid characters in Apartment multiple input errors
    When I have enter invalid characters "![]&@%?<>!$():;~^{}+=|_*ãü木✉" into valid input "4M" on the "street2" and I see validation error message "Please enter valid address format."

  Scenario: User enters additional invalid characters in Apartment multiple input errors
    When I have enter invalid characters "\\\"" into valid input "4M" on the "street2" and I see validation error message "Please enter valid address format."
