Feature: Apartment - Validation Criteria & Error Handling

  Covers
    - CP-799 (D3F-43) Validation scenarios for Apartment input field on Step 2 of Acquisition Flow.
    - CP-799 (D3F-361) Mobile - Apartment - Validation Criteria & Error Handling
  Validation Criteria
    - Not a required field.
    - Max length of 5 characters


  Background: user on Step 2 acquisition flow screen
    Given I am a user on the ck flow
    Given I am on the ck step2 form page


  Scenario: 1 - User enters valid Apartment
    When I have enter valid "street2" value "S56"
    Then I shall be displayed no error for the "street2" field

  Scenario: 2 - User does not enter any characters in Apartment input field
    And without entering "street2"
    Then I shall be displayed no error for the "street2" field

  Scenario: 3 - System restricts the user to enter a maximum of five characters
    When I have enter valid "street2" value "12345678901234567890123456789012345678901234567890123456789012345678901234567890 Address street"
    And I shall be displayed no error for the "street2" field
    Then I enter additional text into "street2" field text " 7890123"
    Then I am restricted from entering more than "100" characters in "street2" field

#  Scenario: 3a - Must be at least 2 characters in length.
#    When I have enter invalid "street2" value "1" that "too short"
#    Then I shall be displayed an error for the "street2" field - "Please enter valid address format." in red

  Scenario: 4 - User enters invalid Apartment multiple input errors
    When I have enter invalid "street2" value I see the correct validation error message
      | apartment_entered | type_of_err                    | err_message                                                                                 |
      | 22 –n             | has a non-ASCII en dash symbol | Please enter valid address format. |
      | 22 —w             | has a non-ASCII em dash symbol | Please enter valid address format. |

  Scenario: 4a - User focuses on the error icon and clicks on it.
    When I have enter invalid "street2" value "22@t" that "has an '@' symbol"
    And I click the X Icon on the "street2" field
    Then I shall be displayed an error for the "street2" field - "Please enter valid address format." in red
    And "street2" field label is displayed in red
    And "street2" field displays X Icon

  Scenario: 4b - User focuses on the Apartment input field that has the error "Please enter valid address format."
    When Action detail "Trigger error state - 'Please enter valid address format.'"
      And I have enter invalid "street2" value "22%n" that "has an '% symbol"
    Then "street2" field does not display X Icon
    And I am displayed a "street2" tooltip - "Use this field to provide your apartment, suite, unit, or floor number." on desktop only
    And I shall be displayed an error for the "street2" field - "Please enter valid address format." in red
    And "street2" field label is displayed in red
    When I have enter valid "street2" value "22A"
    Then "street2" field label is displayed in black
    And "street2" field input is displayed in black
    And I shall be displayed no error for the "street2" field

  Scenario Outline: 5 User enters valid Apartment
    When I have enter a valid "street2" value "<apartment_entered>" that "<testing_character>"
    Then I shall be displayed no error for the "street2" field

    Examples:
      | apartment_entered | testing_character   |
      | 22,b              | has a comma         |
      | #11               | has a number signs  |
      | 22-A              | has a hyphen (-)    |
      | 22 A              | has a space         |
      | 22.1              | has a period        |
      | 22A/B             | has a forward slash |
      | 22A'B             | has a single quote  |

  Scenario: User enters invalid characters in Apartment multiple input errors
    When I have enter invalid characters "![]&@%?<>!$():;~^{}+=|_*ãü木✉" into valid input "4M" on the "street2" and I see validation error message "Please enter valid address format."

  Scenario: User enters additional invalid characters in Apartment multiple input errors
    When I have enter invalid characters "\\\"" into valid input "4M" on the "street2" and I see validation error message "Please enter valid address format."
