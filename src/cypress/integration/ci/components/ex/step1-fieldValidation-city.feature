Feature: City - Validation Criteria and Error Handling

  Covers
  - CP-830 Desktop - EX - Step 1 Page - City - Validation Criteria and Error Handling
  - CP-836 (D3F-820) City field: Make it so that you can include apostrophes in the validation rules. Also apply this to street address, city, and name.
  Validation Criteria
  - Is a required field.
  - Max length of 27 characters
  - Cities may only contain letters and spaces.


  Background: user on Step 1 acquisition flow screen
    Given I am a user on the ex flow
    Given I am on the ex step1 signup page


  Scenario: 1 - User enters valid City with just letters and space
    When I have enter valid "city" value "New York"
    And I shall be displayed no error for the "middleInitial" field
    Then The "city" field border is displayed in green
    And A green checkmark inside the "city" field is displayed

  Scenario: 2 - User without entering City focuses out of City field.
    When without entering "city"
    Then I shall be displayed an error for the "city" field - "This is a required field" in red
    And The "city" field border is outlined in red color
    And A red warning icon inside the "city" field is displayed

  Scenario: 2a - User focuses back on the City field that has the error - "This is a required field."
    When without entering "city"
    Then I shall be displayed an error for the "city" field - "This is a required field" in red
    When I have enter valid "city" value "New York"
    And I shall be displayed no error for the "city" field

  Scenario: 3 - System restricts user from entering more than 27 characters in the City input field.
    When I have enter valid "city" value "Test City New York"
    Then I shall be displayed no error for the "city" field
    And I enter additional text into "city" field text " Test city test"
    And I am restricted from entering more than "27" characters in "city" field

  # extended validations
  Scenario Outline: 1 - User enters valid City
    When I have enter valid "city" value "<city_entered>"
    Then I shall be displayed no error for the "city" field

    Examples:
      | city_entered             |
      | San Diego                |
      | Martha's Vineyard        |
      | Winchester-on-the-Severn |

  Scenario Outline: 4 - User enters invalid City.
    When I have enter invalid "city" value "<city_entered>" that "<type_of_error>"
    Then I shall be displayed an error for the "city" field - "<error_message>" in red

    Examples:
      | city_entered             | type_of_error               | error_message                               |
      | New / York               | has a '/' symbol            | Cities may only contain letters and spaces. |
      | San José                 | has a extended latin symbol | Cities may only contain letters and spaces. |
      | St. Louis                | has a '.' symbol            | Cities may only contain letters and spaces. |

    # performance optimized multi value test
    # benefit fast test execution
    # downside less specific error data bubbled up to the top level report,
    # downside reported as 1 test though it's many
    # stops on error not testing every permutation

    # TIP: if it fails to test every permutation comment out the next three lines an let table be used by previous Scenario Outline

  Scenario: 4a - User enters invalid City multiple input errors.
  I have enter invalid "(.*?)" value I see the correct validation error message
    When I have enter invalid "city" value I see the correct validation error message
      | city_entered    | type_of_error                  | error_message                               |
      | New 45 York     | has a number                   | Cities may only contain letters and spaces. |
      | New York –north | has a non-ASCII en dash symbol | Cities may only contain letters and spaces. |
      | New York —west  | has a non-ASCII em dash symbol | Cities may only contain letters and spaces. |

  Scenario: 4b - User focuses on the City input field that has the error "Cities may only contain letters and spaces."
    When Action detail "Trigger error state - 'Cities may only contain letters and spaces.'"
    And I have enter invalid "city" value "New &York" that "has an '&' symbol"
   Then I shall be displayed an error for the "city" field - "Cities may only contain letters and spaces." in red
    When I have enter valid "city" value "New York"
    And I shall be displayed no error for the "city" field

  Scenario: User enters invalid characters in City multiple input errors
    When I have enter invalid characters "![]&@%?<>!$():;~^{}+=|_*ãü木✉" into valid input "twn" on the "city" and I see validation error message "Cities may only contain letters and spaces."

  Scenario: User enters additional invalid characters in City multiple input errors
    When I have enter invalid characters ",#\//\"" into valid input "twn" on the "city" and I see validation error message "Cities may only contain letters and spaces."
