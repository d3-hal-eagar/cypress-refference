Feature: ex/step1-fieldValidation-city.feature

  Covers
  - CP-830 Desktop - EX - Step 1 Page - City - Validation Criteria and Error Handling
  - CP-836 (D3F-820) City field: Make it so that you can include apostrophes in the validation rules. Also apply this to street address, city, and name.
  Validation Criteria
  - Is a required field.
  - Max length of 27 characters
  - Please enter a valid city.


  Background: user on Step 1 acquisition flow screen
    Given I am a user on the ex flow
    Given I am on the ex step1 signup page


  Scenario: 1 - User enters valid City with just letters and space
    When I have enter valid "city" value "New York"
    And I shall be displayed no error for the "city" field
    Then The "city" field border is displayed in green
    And A green checkmark inside the "city" field is displayed

  Scenario: 2 - User without entering City focuses out of City field.
    When without entering "city"
    Then I shall be displayed an error for the "city" field - "Please enter a valid city." in red
    And The "city" field border is outlined in red color
    And A red warning icon inside the "city" field is displayed

  Scenario: 2a - User focuses back on the City field that has the error - "Please enter a valid city."
    When without entering "city"
    Then I shall be displayed an error for the "city" field - "Please enter a valid city." in red
    When I have enter valid "city" value "New York"
    And I shall be displayed no error for the "city" field

  Scenario: 3 - System restricts user from entering more than 27 characters in the City input field.
    When I have enter valid "city" value "Test City New York"
    Then I shall be displayed no error for the "city" field
    And I enter additional text into "city" field text " Test city test"
    And I am restricted from entering more than "27" characters in "city" field

  # extended validations
  Scenario: 1 - User enters valid City
    When I have enter valid "city" value I do not see the validation error message
      | city_entered             |
      | San Diego                |
      | Martha's Vineyard        |
      | Winchester-on-the-Severn |

  Scenario: 4 - User enters invalid City.
    When I have enter invalid "city" value I see the correct validation error message
      | city_entered             | type_of_error               | error_message                               |
      | New / York               | has a '/' symbol            | Please enter a valid city. |
      | San José                 | has a extended latin symbol | Please enter a valid city. |
      | St. Louis                | has a '.' symbol            | Please enter a valid city. |
      | Town323                  | has a numer                 | Please enter a valid city. |

  Scenario: 4a - User enters invalid City multiple input errors.
    When I have enter invalid "city" value I see the correct validation error message
      | city_entered    | type_of_error                  | error_message                               |
      | New 45 York     | has a number                   | Please enter a valid city. |
      | New York –north | has a non-ASCII en dash symbol | Please enter a valid city. |
      | New York —west  | has a non-ASCII em dash symbol | Please enter a valid city. |

  Scenario: 4b - User focuses on the City input field that has the error "Please enter a valid city."
    When Action detail "Trigger error state - 'Please enter a valid city.'"
    And I have enter invalid "city" value "New &York" that "has an '&' symbol"
   Then I shall be displayed an error for the "city" field - "Please enter a valid city." in red
    When I have enter valid "city" value "New York"
    And I shall be displayed no error for the "city" field

  Scenario: User enters invalid characters in City multiple input errors
    When I have enter invalid characters "![]&@%?<>!$():;~^{}+=|*ãü木✉" into valid input "twn" on the "city" and I see validation error message "Please enter a valid city."

  Scenario: User enters additional invalid characters in City multiple input errors
    When I have enter invalid characters ",#_\/\\\"" into valid input "twn" on the "city" and I see validation error message "Please enter a valid city."
