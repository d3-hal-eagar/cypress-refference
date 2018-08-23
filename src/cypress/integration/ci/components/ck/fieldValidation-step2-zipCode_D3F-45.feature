Feature: Zip Code - Validation Criteria & Character Restriction

  Covers
    - D3F-45 Validation scenarios for Zip Code input field in Step 2 of Acquisition Flow.
    - D3F-366 Mobile - Zip Code - Validation Criteria & Character Restriction
  Validation Criteria
    - Is a required field.
    - must be exactly 5 digits long.


  Background: user on Step 2 acquisition flow screen
    Given I am a user on the ck flow
    Given I am on the ck step2 form page


  Scenario: 1 - User enters valid Zip Code
    When I have enter valid "zip" value "10007"
    And I blur the "zip" field
    Then I shall be displayed no error for the "zip" field

  Scenario: 2 - System restricts the user to enter a maximum of five characters
    When I have enter valid "zip" value "12345"
    And I blur the "zip" field
    Then I shall be displayed no error for the "zip" field
    And I enter additional text into "zip" field text "678"
    And I am restricted from entering more than "5" characters in "zip" field

  Scenario: 3 - User enters less than 5 digits on Zip Code input field
    When I have enter invalid "zip" value "100" that "has less than 5 digits"
    And I blur the "zip" field
    Then I shall be displayed an error for the "zip" field - "Zip codes must be exactly 5 digits long." in red font color
    And "zip" field label is displayed in red

  Scenario: 3a - User focuses back on the Zip-Code field that has the error "Zip codes must be exactly 5 digits long."
    When Action detail "Trigger error state - 'Zip codes must be exactly 5 digits long.'"
      And I have enter invalid "zip" value "123" that "has less than 5 digits"
      And I blur the "zip" field
    And I focus on the "zip" field
    Then I shall be displayed an error for the "zip" field - "Zip codes must be exactly 5 digits long." in red font color
    And "zip" field label is displayed in red
    When I have enter valid "zip" value "10007"
    Then "zip" field label is displayed in black
    And "zip" field input is displayed in black
    And I shall be displayed no error for the "zip" field

  Scenario Outline: 4 - User enters alphabets/special characters
    When Action detail "Trigger error state - 'Please use numbers only in this field.'"
      And I have enter invalid "zip" value "<zip_entered>" that "<type_of_err>"
      And I blur the "zip" field
    Then I shall be displayed an error for the "zip" field - "<err_message>" in red font color
    And "zip" field label is displayed in red
    And "zip" input field is displayed in red

    Examples:
      | zip_entered | type_of_err      | err_message                                                                                 |
      | 123O5             | has a 'O' letter | Please use numbers only in this field. |
      | 12'35             | has a ''' symbol | Please use numbers only in this field. |
      | 22,12             | has a ',' symbol | Please use numbers only in this field. |

    # performance optimized multi value test
    # benefit fast test execution
    # downside less specific error data bubbled up to the top level report,
    # downside reported as 1 test though it's many
    # stops on error not testing every permutation

    # TIP: if it fails to test every permutation comment out the next three lines an let table be used by previous Scenario Outline
  Scenario: 4 - User enters alphabets/special characters
    When I have enter invalid "zip" value I see the correct validation error message
      | apartment_entered | type_of_err                    | err_message                            |
      | 22z12             | has a 'z' letter               | Please use numbers only in this field. |
      | 22#12             | has a '#' symbol               | Please use numbers only in this field. |
      | 22.12             | has a '.' symbol               | Please use numbers only in this field. |
      | 1\\123            | has a '\\' symbol              | Please use numbers only in this field. |
      | 22"00             | has a '"' symbol               | Please use numbers only in this field. |
      | 22–09             | has a non-ASCII en dash symbol | Please use numbers only in this field. |
      | 22—21             | has a non-ASCII em dash symbol | Please use numbers only in this field. |

  Scenario: 4a - User focuses back on the Zip-Code field that has the error "Please use numbers only in this field"
    When Action detail "Trigger error state - 'Please use numbers only in this field.'"
      And I have enter invalid "zip" value "100%2" that "has an '%' symbol"
      And I blur the "zip" field
    And I focus on the "zip" field
    Then I shall be displayed an error for the "zip" field - "Please use numbers only in this field." in red font color
    And "zip" field label is displayed in red
    When I have enter valid "zip" value "31023"
    Then "zip" field label is displayed in black
    And "zip" field input is displayed in black
    And I shall be displayed no error for the "zip" field

    # Validation scenarios for Zip Code - When user does not enter any characters.

  Scenario: 5 - User does not enter a Zip Code
    When I focus on the "zip" field
    And without entering "zip"
    And I blur the "zip" field
    Then I shall be displayed an error for the "zip" field - "This is a required field." in red font color
    And "zip" field label is displayed in red

  Scenario: 5a - User focuses back on the Zip code field that has the error - "This is a required field."
    When I focus on the "zip" field
    And without entering "zip"
    And I blur the "zip" field
    And I focus on the "zip" field
    Then I shall be displayed an error for the "zip" field - "This is a required field." in red font color
    And "zip" field label is displayed in red
    When I have enter valid "zip" value "99999"
    Then "zip" field label is displayed in black
    And "zip" field input is displayed in black
    And I shall be displayed no error for the "zip" field

  Scenario: User enters invalid characters in Zip code multiple input errors
    When I have enter invalid characters "![]&@%?<>!$():;~^{}+=|_*ãü木✉" into valid input "1234" on the "zip" and I see validation error message "Please use numbers only in this field."

  Scenario: User enters additional invalid characters in Zip code multiple input errors
    When I have enter invalid characters ".,#'\//\" " into valid input "1234" on the "zip" and I see validation error message "Please use numbers only in this field."
