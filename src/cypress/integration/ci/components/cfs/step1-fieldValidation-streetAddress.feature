Feature: cfs/step1-fieldValidation-streetAddress.feature

  covers
    - CP-369 Desktop/Mobile - CFS - Step 1 Page - Street Address Field

  Validation Criteria
    - Is a required field.
    - Min length of 1 characters and Max length of 100 characters
    - Street address may only contain
    - contains only Letters, numbers, commas, dashes, number signs, and spaces.


  Background: user on Step 1 acquisition flow screen
    Given I am a user on the cfs flow
    Given I am on the cfs step1 page


  Scenario: 1 - User enters Street Address
    When I have enter valid "street1" value "22 Cortland st"
    And I click element "cta-button"
    Then I shall be displayed no error for the "street1" field

  Scenario: 2 - System restricts the user from entering more than 100 characters.
    When I have enter valid "street1" value "12345678901234567890123456789012345678901234567890123456789012345678901234567890 Address street"
    And I click element "cta-button"
    And I shall be displayed no error for the "street1" field
    Then I enter additional text into "street1" field text " 7890123"
    And I click element "cta-button"
    Then I am restricted from entering more than "100" characters in "street1" field

  Scenario: 2a - Must be at least 2 characters in length.
    When I have enter invalid "street1" value "1" that "too short"
    And I click element "cta-button"
    Then I shall be displayed an error for the "street1" field - "Please enter your street address." in red

  # Validation scenarios for Street Address input field - When user does not enter any characters in the field.

  Scenario: 3 - User without entering Street Address focuses out of Street Address field.
    When without entering "street1"
    And I click element "cta-button"
    And "street1" input field shall be outlined in red
    #CP-514 #Then I shall be displayed an error for the "street1" field - "Billing Address cannot be blank." in red
    Then I shall be displayed an error for the "street1" field - "Please enter your street address." in red

  Scenario: 3b - User focuses on the Street Address input field that has the error "Please enter your street address."
    When without entering "street1"
    And I click element "cta-button"
    #CP-514 #Then I shall be displayed an error for the "street1" field - "Billing Address cannot be blank." in red
    Then I shall be displayed an error for the "street1" field - "Please enter your street address." in red
    Then I enter additional text into "street1" field text "22 Cortland st"
    And I click element "cta-button"
    And I shall be displayed no error for the "street1" field
    Then I enter additional text into "street1" field text " %^&"
    And I click element "cta-button"
    And "street1" input field shall be outlined in red
    Then I shall be displayed an error for the "street1" field - "Please enter your street address." in red

  #CP-514 Scenario: 6
#  Scenario: 4 - Only Numbers in Address Field
#    When I have enter invalid "street1" value "134" that "has only numbers"
#    And I click element "cta-button"
#    Then I shall be displayed an error for the "street1" field - "Billing Address cannot have only numbers." in red

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
    And I click element "cta-button"
    And I shall be displayed an error for the "street1" field - "Please enter your street address." in red
    And I click element "cta-button"
    When I have enter valid "street1" value "22 Cortland st"
    And I click element "cta-button"
    And I shall be displayed no error for the "street1" field

  Scenario: User enters invalid characters in Street Address multiple input errors
    When I have enter invalid characters "![]&@%?<>!$():;~^{}+=|*ãü木✉" into valid input "road" on the "street1" and I see validation error message "Please enter your street address."

  Scenario: User enters additional invalid characters in Street Address multiple input errors
  # yea escaping this tests quote " and \
    When I have enter invalid characters "_\\\"" into valid input "road" on the "street1" and I see validation error message "Please enter your street address."
