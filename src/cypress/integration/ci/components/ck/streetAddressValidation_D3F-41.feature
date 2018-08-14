Feature: Street Address - Validation Criteria & Error Handling

  D3F-41
  Validation scenarios for Street Address input field in Step 2 of Acquisition Flow.

  Validation Criteria:
  - Is a required field.
  - Min length of 2 characters and Max length of 100 characters
  - Street address may only contain

  1.Letters, numbers, commas, dashes, number signs, and spaces.
  2. Address must be between 1 and 100 characters in length.
  3. Cities may only contain letters and spaces.
  4. States may only contain letters and spaces.
  5. Zip codes must be exactly 5 digits long.

  Background: user on Step 2 acquisition flow screen
    Given I am a user on the ck flow
    When I am on the ck step2 form page


  Scenario: 1 - User enters Street Address
    When I focus on the "street1" field
    When I have enter valid "street1" value "22 Cortland st"
    And I focus on the "street2" field
    Then I shall be displayed no error for the "street1" field

  Scenario: 2 - System restricts the user from entering more than 100 characters.
    When I focus on the "street1" field
    When I have enter valid "street1" value "12345678901234567890123456789012345678901234567890123456789012345678901234567890 Address street"
    When I focus on the "street2" field
    And I shall be displayed no error for the "street1" field
    Then I enter additional text into "street1" field text " 7890123"
    Then I am restricted from entering more than "100" characters in "street1" field

  # Validation scenarios for Street Address input field - When user does not enter any characters in the field.

  Scenario: 3 - User without entering Street Address focuses out of Street Address field.
    When I focus on the "street1" field
    And I focus on the "street2" field
    Then I shall be displayed an error for the "street1" field - "This is a required field" in red font color
    And "street1" field label is displayed in red
    And "street1" field displays X Icon

  Scenario: 3a - User focuses on the error icon and clicks on it.
    When I focus on the "street1" field
    And I focus on the "street2" field
    And I focus and click on X icon inside the "street1" input field
    Then I shall be displayed an error for the "street1" field - "This is a required field" in red font color
    And "street1" field label is displayed in red
    And "street1" field displays X Icon

  Scenario: 3b - User focuses on the Street Address input field that has the error "This is a required field"
    When I focus on the "street1" field
    And I focus on the "street2" field
    And Action detail "Trigger error state - 'This is a required field'"
    And I focus on the "street1" field
    Then "street1" field does not display X Icon
    And I am displayed a "street1" tooltip - "Moved in the last 6 months? Try using your previous address instead." on desktop only
    Then I shall be displayed an error for the "street1" field - "This is a required field" in red font color
    And "street1" field label is displayed in red
    When I have enter valid "street1" value "22 Cortland st"
    Then "street1" field label is displayed in black
    And "street1" field input is displayed in black
    And I shall be displayed no error for the "street1" field

  # Validation scenarios for Street Address input field when user enters invalid address.

  Scenario Outline: 4 - User enters invalid Street Address
    When I focus on the "street1" field
    And I have enter invalid "street1" value "<street_address_entered>" that "<type_of_err>"
    And I focus on the "street2" field
    Then I shall be displayed an error for the "street1" field - "<err_message>" in red font color
    And "street1" field label is displayed in red
    And "street1" field input is displayed in red
    And "street1" field displays X Icon
    Examples:
      | street_address_entered | type_of_err       | err_message                                                                                 |
      | 22 Cort!and street     | has a '!' symbol  | Street address may only contain letters, numbers, commas, dashes, number signs, and spaces. |
      | 22 Cortland / street   | has a '/' symbol  | Street address may only contain letters, numbers, commas, dashes, number signs, and spaces. |
      | 22 Cortland \\ street  | has a '\\' symbol | Street address may only contain letters, numbers, commas, dashes, number signs, and spaces. |
      | 22 Cortland ' street   | has a ''' symbol  | Street address may only contain letters, numbers, commas, dashes, number signs, and spaces. |

    # performance optimized multi value test
    # benefit fast test execution
    # downside less specific error data bubbled up to the top level report,
    # downside reported as 1 test though it's many
    # stops on error not testing every permutation

    # TIP: if it fails to test every permutation comment out the next three lines an let table be used by previous Scenario Outline
  Scenario: 4 - User enters invalid Street Address multiple input errors
    When I have enter invalid "street1" value I see the correct validation error message
      | street_address_entered   | type_of_err                    | err_message                                                                                 |
      | 22 Cort!and street       | has a ! symbol                 | Street address may only contain letters, numbers, commas, dashes, number signs, and spaces. |
      | 22 Cortland [ street     | has a '[' symbol               | Street address may only contain letters, numbers, commas, dashes, number signs, and spaces. |
      | 22 Cortland ] street     | has a ']' symbol               | Street address may only contain letters, numbers, commas, dashes, number signs, and spaces. |
      | 22 Cortland & street     | has a '&' symbol               | Street address may only contain letters, numbers, commas, dashes, number signs, and spaces. |
      | 22 Cortland @ street     | has a '@' symbol               | Street address may only contain letters, numbers, commas, dashes, number signs, and spaces. |
      | 22 Cortland % street     | has a '%' symbol               | Street address may only contain letters, numbers, commas, dashes, number signs, and spaces. |
      | 22 Cortland & street     | has a '&' symbol               | Street address may only contain letters, numbers, commas, dashes, number signs, and spaces. |
      | 22 Cortland ? street     | has a '?' symbol               | Street address may only contain letters, numbers, commas, dashes, number signs, and spaces. |
      | 22 Cortland > street     | has a '>' symbol               | Street address may only contain letters, numbers, commas, dashes, number signs, and spaces. |
      | 22 Cortland < street     | has a '<' symbol               | Street address may only contain letters, numbers, commas, dashes, number signs, and spaces. |
      | 22 Cortland " street     | has a '"' symbol               | Street address may only contain letters, numbers, commas, dashes, number signs, and spaces. |
      | 22 Cortland $ street     | has a '$' symbol               | Street address may only contain letters, numbers, commas, dashes, number signs, and spaces. |
      | 22 Cortland ) street     | has a ')' symbol               | Street address may only contain letters, numbers, commas, dashes, number signs, and spaces. |
      | 22 Cortland ( street     | has a '(' symbol               | Street address may only contain letters, numbers, commas, dashes, number signs, and spaces. |
      | 22 Cortland : street     | has a ':' symbol               | Street address may only contain letters, numbers, commas, dashes, number signs, and spaces. |
      | 22 Cortland ; street     | has a ';' symbol               | Street address may only contain letters, numbers, commas, dashes, number signs, and spaces. |
      | 22 Cortland ~ street     | has a '~' symbol               | Street address may only contain letters, numbers, commas, dashes, number signs, and spaces. |
      | 22 Cortland ^ street     | has a '^' symbol               | Street address may only contain letters, numbers, commas, dashes, number signs, and spaces. |
      | 22 Cortland } street     | has a '}' symbol               | Street address may only contain letters, numbers, commas, dashes, number signs, and spaces. |
      | 22 Cortland { street     | has a '{' symbol               | Street address may only contain letters, numbers, commas, dashes, number signs, and spaces. |
      | 22 Cortland + street     | has a '+' symbol               | Street address may only contain letters, numbers, commas, dashes, number signs, and spaces. |
      | 22 Cortland _ street     | has a '_' symbol               | Street address may only contain letters, numbers, commas, dashes, number signs, and spaces. |
      | 22 Cortland * street     | has a '*' symbol               | Street address may only contain letters, numbers, commas, dashes, number signs, and spaces. |
      | São Paulo                | has a non-ASCII symbol         | Street address may only contain letters, numbers, commas, dashes, number signs, and spaces. |
      | Nürnberg                 | has a non-ASCII symbol         | Street address may only contain letters, numbers, commas, dashes, number signs, and spaces. |
      | 22 Cortand street –north | has a non-ASCII en dash symbol | Street address may only contain letters, numbers, commas, dashes, number signs, and spaces. |
      | 22 Cortand street —west  | has a non-ASCII em dash symbol | Street address may only contain letters, numbers, commas, dashes, number signs, and spaces. |
      | Roppongi 六本木             | has a unicode HAN symbol       | Street address may only contain letters, numbers, commas, dashes, number signs, and spaces. |
      | 22 Cortland ✉ street     | has a emoji symbol             | Street address may only contain letters, numbers, commas, dashes, number signs, and spaces. |

  Scenario: 4a - User focuses on the error icon and clicks on it.
    When I focus on the "street1" field
    And I have enter invalid "street1" value "22 Cortl@nd streeet" that "has an '@' symbol"
    And I focus on the "street2" field
    And I focus and click on X icon inside the "street1" input field
    Then I shall be displayed an error for the "street1" field - "Street address may only contain letters, numbers, commas, dashes, number signs, and spaces." in red font color
    And "street1" field label is displayed in red
    And "street1" field displays X Icon

  Scenario: 4b - User focuses on the Street Address input field that has the error "Street address may only contain letters, numbers, commas, dashes, number signs, and spaces."
    When I focus on the "street1" field
    And I have enter invalid "street1" value "22 Cortl%nd streeet" that "has an '% symbol"
    And I focus on the "street2" field
    And Action detail "Trigger error state - 'Street address may only contain letters, numbers, commas, dashes, number signs, and spaces.'"
    And I focus on the "street1" field
    Then "street1" field does not display X Icon
    And I am displayed a "street1" tooltip - "Moved in the last 6 months? Try using your previous address instead." on desktop only
    Then I shall be displayed an error for the "street1" field - "Street address may only contain letters, numbers, commas, dashes, number signs, and spaces." in red font color
    And "street1" field label is displayed in red
    When I have enter valid "street1" value "22 Cortland st"
    Then "street1" field label is displayed in black
    And "street1" field input is displayed in black
    And I shall be displayed no error for the "street1" field


  Scenario Outline: 5 User enters valid Street Address
    When I focus on the "street1" field
    When I have enter valid "street1" value "<street_address_entered>"
    And I focus on the "street2" field
    Then I shall be displayed no error for the "street1" field
    Examples:
      | street_address_entered | testing_character |
      | 22 Cortand street, sw  | commas            |
      | 22 Cortand street #11  | number signs      |
      | 22 Cortand street-east | hyphen (-)        |
