Feature: Street Address - Validation Criteria & Error Handling

  covers
    - CP-818 (D3F-41) Validation scenarios for Street Address input field in Step 2 of Acquisition Flow.
    - CP-829 (D3F-359) Mobile - Street Address - Validation Criteria & Error Handling
    - CP-836 (D3F-820) City field: Make it so that you can include apostrophes in the validation rules. Also apply this to street address, city, and name.
  Validation Criteria
    - Is a required field.
    - Min length of 1 characters and Max length of 100 characters
    - Street address may only contain
    - contains only Letters, numbers, commas, dashes, number signs, and spaces.


  Background: user on Step 2 acquisition flow screen
    Given I am a user on the ck flow
    Given I am on the ck step2 form page


  Scenario: 1 - User enters Street Address
    When I have enter valid "street1" value "22 Cortland st"
    Then I shall be displayed no error for the "street1" field

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
    Then I shall be displayed an error for the "street1" field - "Please enter your street address." in red
    And "street1" field label is displayed in red
    And "street1" field displays X Icon

  Scenario: 3a - User clicks on the error icon
    When without entering "street1"
    And I blur the "street1" field
    And I click the X Icon on the "street1" field
    Then Check that the "street1" field is not focused
    And I shall be displayed an error for the "street1" field - "Please enter your street address." in red
    And "street1" field label is displayed in red
    And "street1" field displays X Icon

  Scenario: 3b - User focuses on the Street Address input field that has the error "Please enter your street address."
   When without entering "street1"
    Then "street1" field does not display X Icon
    And I am displayed a "street1" tooltip - "Moved in the last 6 months? Try using your previous address instead." on desktop only
    Then I shall be displayed an error for the "street1" field - "Please enter your street address." in red
    And "street1" field label is displayed in red
    When I have enter valid "street1" value "22 Cortland st"
    Then "street1" field label is displayed in black
    And "street1" field input is displayed in black
    And I shall be displayed no error for the "street1" field

  # extended validations
  Scenario: 1 - User enters valid StreetAddress
    When I have enter valid "street1" value I do not see the validation error message
      | street_entered                |
      | High Lane #44                 |
      | 22 Cortand street, suite 1103 |
      | 41-45 45th st                 |
      | Scholars' Walk                |
      | 42nd st.                      |
      | 46th st/Packard st            |

  Scenario: User enters invalid Street Address multiple input errors
    When I have enter invalid "street1" value I see the correct validation error message
      | street_address_entered   | type_of_err                    | err_message                                                                                 |
      | 22 Cortand street –north | has a non-ASCII en dash symbol | Please enter your street address. |
      | 22 Cortand street —west  | has a non-ASCII em dash symbol | Please enter your street address. |

  Scenario: 4a - User clicks on the error icon
    When I have enter invalid "street1" value "22 Cortl@nd streeet" that "has an '@' symbol"
    And I blur the "street1" field
    And I click the X Icon on the "street1" field
    Then Check that the "street1" field is not focused
    And I shall be displayed an error for the "street1" field - "Please enter your street address." in red
    And "street1" field label is displayed in red
    And "street1" field displays X Icon

  Scenario: 4b - User focuses on the Street Address input field that has the error "Please enter your street address."
    When Action detail "Trigger error state - 'Please enter your street address.'"
      And I have enter invalid "street1" value "22 Cortl%nd streeet" that "has an '% symbol"
    Then "street1" field does not display X Icon
    And I am displayed a "street1" tooltip - "Moved in the last 6 months? Try using your previous address instead." on desktop only
    And I shall be displayed an error for the "street1" field - "Please enter your street address." in red
    And "street1" field label is displayed in red
    When I have enter valid "street1" value "22 Cortland st"
    Then "street1" field label is displayed in black
    And "street1" field input is displayed in black
    And I shall be displayed no error for the "street1" field

  Scenario: User enters invalid characters in Street Address multiple input errors
    When I have enter invalid characters "![]&@%?<>!$():;~^{}+=|*ãü木✉" into valid input "road" on the "street1" and I see validation error message "Please enter your street address."

  Scenario: User enters additional invalid characters in Street Address multiple input errors
  # yea escaping this tests quote " and \
    When I have enter invalid characters "_\\\"" into valid input "road" on the "street1" and I see validation error message "Please enter your street address."
