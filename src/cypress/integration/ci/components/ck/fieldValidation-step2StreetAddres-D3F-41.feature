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
    And I blur the "street1" field
    Then I shall be displayed no error for the "street1" field

  Scenario: 2 - System restricts the user from entering more than 100 characters.
    When I have enter valid "street1" value "12345678901234567890123456789012345678901234567890123456789012345678901234567890 Address street"
    And I blur the "street1" field
    And I shall be displayed no error for the "street1" field
    Then I enter additional text into "street1" field text " 7890123"
    Then I am restricted from entering more than "100" characters in "street1" field

  # Validation scenarios for Street Address input field - When user does not enter any characters in the field.

  Scenario: 3 - User without entering Street Address focuses out of Street Address field.
    When I focus on the "street1" field
    And without entering "street1"
    And I blur the "street1" field
    Then I shall be displayed an error for the "street1" field - "This is a required field" in red font color
    And "street1" field label is displayed in red
    And "street1" field displays X Icon

  Scenario: 3a - User clicks on the error icon
    When I focus on the "street1" field
    And I blur the "street1" field
    And I click the X Icon on the "street1" field
    Then Check that the "street1" field is not focused
    And I shall be displayed an error for the "street1" field - "This is a required field" in red font color
    And "street1" field label is displayed in red
    And "street1" field displays X Icon

  Scenario: 3b - User focuses on the Street Address input field that has the error "This is a required field"
    When Action detail "Trigger error state - 'This is a required field'"
      And I focus on the "street1" field
      And I blur the "street1" field
    And I focus on the "street1" field
    Then "street1" field does not display X Icon
    And I am displayed a "street1" tooltip - "Moved in the last 6 months? Try using your previous address instead." on desktop only
    Then I shall be displayed an error for the "street1" field - "This is a required field" in red font color
    And "street1" field label is displayed in red
    When I have enter valid "street1" value "22 Cortland st"
    Then "street1" field label is displayed in black
    And "street1" field input is displayed in black
    And I shall be displayed no error for the "street1" field

  # extended validations
  Scenario Outline: 1 - User enters valid StreetAddress
    When I have enter valid "street1" value "<street_entered>"
    And I blur the "street1" field
    Then I shall be displayed no error for the "street1" field

    Examples:
      | street_entered                |
      | High Lane #44                 |
      | 22 Cortand street, suite 1103 |
      | 41-45 45th st                 |
      | Scholars' Walk                |

  # Validation scenarios for Street Address input field when user enters invalid address.
#
#  Scenario Outline: 4 - User enters invalid Street Address
#    When I have enter invalid "street1" value "<street_address_entered>" that "<type_of_err>"
#    And I blur the "street1" field
#    Then I shall be displayed an error for the "street1" field - "<err_message>" in red font color
#    And "street1" field label is displayed in red
#    And "street1" input field is displayed in red
#    And "street1" field displays X Icon
#
#    Examples:
#      | street_address_entered | type_of_err       | err_message                                                                                 |
#      | 22 Cortland / street   | has a '/' symbol  | Street address may only contain letters, numbers, commas, dashes, number signs, and spaces. |

  Scenario: User enters invalid Street Address multiple input errors
    When I have enter invalid "street1" value I see the correct validation error message
      | street_address_entered   | type_of_err                    | err_message                                                                                 |
      | 22 Cortand street –north | has a non-ASCII en dash symbol | Street address may only contain letters, numbers, commas, dashes, number signs, and spaces. |
      | 22 Cortand street —west  | has a non-ASCII em dash symbol | Street address may only contain letters, numbers, commas, dashes, number signs, and spaces. |

    # performance optimized multi value test
    # benefit over the dataTable is concise gherkin and less duplication
    # downside no description of the invalid character, super long line
  Scenario: User enters invalid characters in Street Address multiple input errors
    When I have enter invalid characters "![]&@%?<>!$():;~^{}+=|_*ãü木✉" into valid input "some st" on the "street1" and I see validation error message "Street address may only contain letters, numbers, commas, dashes, number signs, and spaces."

  Scenario: 4a - User clicks on the error icon
    When I have enter invalid "street1" value "22 Cortl@nd streeet" that "has an '@' symbol"
    And I blur the "street1" field
    And I click the X Icon on the "street1" field
    Then Check that the "street1" field is not focused
    And I shall be displayed an error for the "street1" field - "Street address may only contain letters, numbers, commas, dashes, number signs, and spaces." in red font color
    And "street1" field label is displayed in red
    And "street1" field displays X Icon

  Scenario: 4b - User focuses on the Street Address input field that has the error "Street address may only contain letters, numbers, commas, dashes, number signs, and spaces."
    When Action detail "Trigger error state - 'Street address may only contain letters, numbers, commas, dashes, number signs, and spaces.'"
      And I have enter invalid "street1" value "22 Cortl%nd streeet" that "has an '% symbol"
      And I blur the "street1" field
    And I focus on the "street1" field
    Then "street1" field does not display X Icon
    And I am displayed a "street1" tooltip - "Moved in the last 6 months? Try using your previous address instead." on desktop only
    And I shall be displayed an error for the "street1" field - "Street address may only contain letters, numbers, commas, dashes, number signs, and spaces." in red font color
    And "street1" field label is displayed in red
    When I have enter valid "street1" value "22 Cortland st"
    Then "street1" field label is displayed in black
    And "street1" field input is displayed in black
    And I shall be displayed no error for the "street1" field

  Scenario: User enters invalid characters in Street Address multiple input errors
    When I have enter invalid characters "![]&@%?<>!$():;~^{}+=|_*ãü木✉" into valid input "road" on the "street1" and I see validation error message "Street address may only contain letters, numbers, commas, dashes, number signs, and spaces."

  Scenario: User enters additional invalid characters in Street Address multiple input errors
    When I have enter invalid characters ".\//\"" into valid input "road" on the "street1" and I see validation error message "Street address may only contain letters, numbers, commas, dashes, number signs, and spaces."
