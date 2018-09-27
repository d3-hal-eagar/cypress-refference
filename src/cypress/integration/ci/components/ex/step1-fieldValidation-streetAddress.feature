Feature: ex/step1-fieldValidation-streetAddress.feature

  covers
    - CP-800 Desktop - EX - Step 1 Page - Current Street Address - Validation Criteria & Error Handling
    - CP-836 (D3F-820) City field: Make it so that you can include apostrophes in the validation rules. Also apply this to street address, city, and name.
  Validation Criteria
    - Is a required field.
    - Min length of 1 characters and Max length of 100 characters
    - Street address may only contain
    - contains only Letters, numbers, commas, dashes, number signs, and spaces.


  Background: user on Step 1 acquisition flow screen
    Given I am a user on the ex flow
    Given I am on the ex step1 signup page


  Scenario: 1 - User enters Street Address
    When I have enter valid "street1" value "22 Cortland st"
    Then I shall be displayed no error for the "street1" field
    And "street1" field does not display warning Icon
    And "street1" field displays check Icon
    And "street1" input field shall be outlined in green

  Scenario: 2 - System restricts the user from entering more than 100 characters.
    When I have enter valid "street1" value "12345678901234567890123456789012345678901234567890123456789012345678901234567890 Address street"
    And I shall be displayed no error for the "street1" field
    Then I enter additional text into "street1" field text " 7890123"
    Then I am restricted from entering more than "100" characters in "street1" field

  Scenario: 2a - Must be at least 2 characters in length.
    When I have enter invalid "street1" value "1" that "too short"
    Then I shall be displayed an error for the "street1" field - "Please enter your street address." in red

  # Validation scenarios for Street Address input field - When user does not enter any characters in the field.

  Scenario: 3 - User without entering Street Address focuses out of Street Address field.
    When without entering "street1"
    Then "street1" field displays warning Icon
    And "street1" input field shall be outlined in red
    Then I shall be displayed an error for the "street1" field - "Please enter your street address." in red

  Scenario: 3b - User focuses on the Street Address input field that has the error "Please enter your street address."
    When without entering "street1"
    Then I shall be displayed an error for the "street1" field - "Please enter your street address." in red
    And "street1" input field shall be black
    Then I enter additional text into "street1" field text "22 Cortland st"
    Then "street1" field does not display warning Icon
    And "street1" field displays check Icon
    And "street1" input field shall be outlined in green
    And I shall be displayed no error for the "street1" field
    Then I enter additional text into "street1" field text " %^&"
    Then "street1" field displays warning Icon
    And "street1" input field shall be outlined in red
    Then I shall be displayed an error for the "street1" field - "Please enter your street address." in red

  # extended validations
  Scenario: 1 - User enters valid StreetAddress
    When I have enter valid "lastName" value I do not see the validation error message
      | street_entered                |
      | High Lane #44                 |
      | 22 Cortand street, suite 1103 |
      | 41-45 45th st                 |
      | Scholars' Walk                |
      | 42nd st.                      |
      | 46th st/Packard st            |

  Scenario: 4b - User focuses on the Street Address input field that has the error
    When I have enter invalid "street1" value "22 Cortl%nd streeet" that "has an '% symbol"
    And I shall be displayed an error for the "street1" field - "Please enter your street address." in red
    When I have enter valid "street1" value "22 Cortland st"
    And I shall be displayed no error for the "street1" field

  Scenario: User enters invalid characters in Street Address multiple input errors
    When I have enter invalid characters "![]&@%?<>!$():;~^{}+=|*ãü木✉" into valid input "road" on the "street1" and I see validation error message "Please enter your street address."

  Scenario: User enters additional invalid characters in Street Address multiple input errors
  # yea escaping this tests quote " and \
    When I have enter invalid characters "_\\\"" into valid input "road" on the "street1" and I see validation error message "Please enter your street address."
