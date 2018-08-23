Feature: Apartment - Validation Criteria & Error Handling

  Covers
    - D3F-43 Validation scenarios for Apartment input field on Step 2 of Acquisition Flow.
    - D3F-361 Mobile - Apartment - Validation Criteria & Error Handling
  Validation Criteria
    - Not a required field.
    - Max length of 5 characters


  Background: user on Step 2 acquisition flow screen
    Given I am a user on the ck flow
    Given I am on the ck step2 form page


  Scenario: 1 - User enters valid Apartment
    When I have enter valid "street2" value "S56"
    And I blur the "street2" field
    Then I shall be displayed no error for the "street2" field

  Scenario: 2 - User does not enter any characters in Apartment input field
    When I focus on the "street2" field
    And without entering "street2"
    And I blur the "street2" field
    Then I shall be displayed no error for the "street2" field

  Scenario: 3 - System restricts the user to enter a maximum of five characters
    When I have enter valid "street2" value "123"
    And I blur the "street2" field
    Then I shall be displayed no error for the "street2" field
    When I enter additional text into "street2" field text "456"
    Then I am restricted from entering more than "5" characters in "street2" field

    # Validation scenarios for invalid Apartment number in Step 2 of Acquisition Flow.
    # Apartment field can only contain letters, numbers, commas, dashes, number signs, and spaces.

#  Scenario Outline: 4 - User enters invalid Apartment Number.
#    When I have enter invalid "street2" value "<apartment_entered>" that "<type_of_err>"
#    And I blur the "street2" field
#    Then I shall be displayed an error for the "street2" field - "<err_message>" in red font color
#    And "street2" field label is displayed in red
#    And "street2" input field is displayed in red
#    And "street2" field displays X Icon
#
#    Examples:
#      | apartment_entered | type_of_err      | err_message                                                                                 |
#      | 22/ C             | has a '/' symbol | Apartment may only contain letters, numbers, commas, dashes, number signs, and spaces. |

  Scenario: 4 - User enters invalid Apartment multiple input errors
    When I have enter invalid "street2" value I see the correct validation error message
      | apartment_entered | type_of_err                    | err_message                                                                                 |
      | 22 –n             | has a non-ASCII en dash symbol | Apartment may only contain letters, numbers, commas, dashes, number signs, and spaces. |
      | 22 —w             | has a non-ASCII em dash symbol | Apartment may only contain letters, numbers, commas, dashes, number signs, and spaces. |

  Scenario: 4a - User focuses on the error icon and clicks on it.
    When I have enter invalid "street2" value "22@t" that "has an '@' symbol"
    And I blur the "street2" field
    And I click the X Icon on the "street2" field
    Then I shall be displayed an error for the "street2" field - "Apartment may only contain letters, numbers, commas, dashes, number signs, and spaces." in red font color
    And "street2" field label is displayed in red
    And "street2" field displays X Icon

  Scenario: 4b - User focuses on the Apartment input field that has the error "Apartment may only contain letters, numbers, commas, dashes, number signs, and spaces."
    When Action detail "Trigger error state - 'Apartment may only contain letters, numbers, commas, dashes, number signs, and spaces.'"
      And I have enter invalid "street2" value "22%n" that "has an '% symbol"
      And I blur the "street2" field
    And I focus on the "street2" field
    Then "street2" field does not display X Icon
    And I am displayed a "street2" tooltip - "Use this field to provide your apartment, suite, unit, or floor number." on desktop only
    And I shall be displayed an error for the "street2" field - "Apartment may only contain letters, numbers, commas, dashes, number signs, and spaces." in red font color
    And "street2" field label is displayed in red
    When I have enter valid "street2" value "22A"
    Then "street2" field label is displayed in black
    And "street2" field input is displayed in black
    And I shall be displayed no error for the "street2" field

  Scenario Outline: 5 User enters valid Apartment
    When I have enter a valid "street2" value "<apartment_entered>" that "<testing_character>"
    And I blur the "street2" field
    Then I shall be displayed no error for the "street2" field

    Examples:
      | apartment_entered | testing_character  |
      | 22,b              | has a comma        |
      | #11               | has a number signs |
      | 22-A              | has a hyphen (-)   |
      | 22 A              | has a space        |

  Scenario: User enters invalid characters in Apartment multiple input errors
    When I have enter invalid characters "![]&@%?<>!$():;~^{}+=|_*ãü木✉" into valid input "4M" on the "street2" and I see validation error message "Apartment may only contain letters, numbers, commas, dashes, number signs, and spaces."

  Scenario: User enters additional invalid characters in Apartment multiple input errors
    When I have enter invalid characters ".\//\"" into valid input "4M" on the "street2" and I see validation error message "Apartment may only contain letters, numbers, commas, dashes, number signs, and spaces."
