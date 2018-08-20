Feature: City - Validation Criteria and Error Handling

  D3F-42 Validation scenarios for City input field in Step 2 of Acquisition Flow.
  D3F-360 Mobile - City - Validation Criteria and Error Handling
  D3F-820 City field: Make it so that you can include apostrophes in the validation rules. Also apply this to street address, city, and name.

  Validation Rules:
  - Is a required field.
  - Max length of 27 characters
  - Cities may only contain letters and spaces.

  Background: user on Step 2 acquisition flow screen
    Given I am a user on the ck flow
    When I am on the ck step2 form page


  Scenario: 1 - User enters City
    When I focus on the "city" field
    And Action detail "I enter a valid City with just letters and space"
    And I have enter valid "city" value "New York"
    And I focus on the "street2" field
    Then I shall be displayed no error for the "city" field

  Scenario: 2 - User without entering City focuses out of City field.
    When Action detail "I focus on City input field, however, do not enter any characters"
    And I focus on the "city" field
    And Action detail "I focus out of the City input field"
    And I focus on the "street2" field
    Then I shall be displayed an error for the "city" field - "This is a required field" in red font color
    And "city" field label is displayed in red

  Scenario: 2a - User focuses back on the City field that has the error - "This is a required field."
    When I focus on the "city" field
    And I focus on the "street2" field
    And Action detail "Trigger error state - 'This is a required field'"
    And I focus on the "city" field
    Then I shall be displayed an error for the "city" field - "This is a required field" in red font color
    And "city" field label is displayed in red
    When I have enter valid "city" value "New York"
    Then "city" field label is displayed in black
    And "city" field input is displayed in black
    And I shall be displayed no error for the "city" field

  Scenario: 3 - System restricts user from entering more than 27 characters in the City input field.
    When I focus on the "city" field
    When I have enter valid "city" value "Test City New York"
    When I focus on the "street2" field
    And I shall be displayed no error for the "city" field
    Then I enter additional text into "city" field text " Test city test"
    Then I am restricted from entering more than "27" characters in "city" field

    #  Validation scenarios for invalid City in Step 2 of Acquisition Flow.
    #  User can enter only letters and space in the city input field.

  # extended validations
  Scenario Outline: 1 - User enters valid City
    When I focus on the "city" field
    And I have enter valid "city" value "<city_entered>"
    And I focus on the "street2" field
    Then I shall be displayed no error for the "city" field
    Examples:
      | city_entered             |
      | San Diego                |
      | Martha's Vineyard        |


  Scenario Outline: 4 - User enters invalid City.
    When I focus on the "city" field
    And I have enter invalid "city" value "<city_entered>" that "<type_of_error>"
    And I focus on the "street2" field
    Then I shall be displayed an error for the "city" field - "<error_message>" in red font color
    And "city" field label is displayed in red
    And "city" field input is displayed in red
    Examples:
      | city_entered             | type_of_error               | error_message                               |
      | New / York               | has a '/' symbol            | Cities may only contain letters and spaces. |
      | New \\ York              | has a '\\' symbol           | Cities may only contain letters and spaces. |
      | San José                 | has a extended latin symbol | Cities may only contain letters and spaces. |
      | St. Louis                | has a '.' symbol            | Cities may only contain letters and spaces. |
      | Winchester-on-the-Severn | has a '-' symbol            | Cities may only contain letters and spaces. |

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
      | New! York       | has a '!' symbol               | Cities may only contain letters and spaces. |
      | New. York       | has a '.' symbol               | Cities may only contain letters and spaces. |
      | New, York       | has a ',' symbol               | Cities may only contain letters and spaces. |
      | New & York      | has a '&' symbol               | Cities may only contain letters and spaces. |
      | New @ York      | has a '@' symbol               | Cities may only contain letters and spaces. |
      | New % York      | has a '%' symbol               | Cities may only contain letters and spaces. |
      | New & York      | has a '&' symbol               | Cities may only contain letters and spaces. |
      | New ? York      | has a '?' symbol               | Cities may only contain letters and spaces. |
      | New > York      | has a '>' symbol               | Cities may only contain letters and spaces. |
      | New < York      | has a '<' symbol               | Cities may only contain letters and spaces. |
      | New " York      | has a '"' symbol               | Cities may only contain letters and spaces. |
      | New $ York      | has a '$' symbol               | Cities may only contain letters and spaces. |
      | New ) York      | has a ')' symbol               | Cities may only contain letters and spaces. |
      | New ( York      | has a '(' symbol               | Cities may only contain letters and spaces. |
      | New : York      | has a ':' symbol               | Cities may only contain letters and spaces. |
      | New ; York      | has a ';' symbol               | Cities may only contain letters and spaces. |
      | New ~ York      | has a '~' symbol               | Cities may only contain letters and spaces. |
      | New ^ York      | has a '^' symbol               | Cities may only contain letters and spaces. |
      | New } York      | has a '}' symbol               | Cities may only contain letters and spaces. |
      | New { York      | has a '{' symbol               | Cities may only contain letters and spaces. |
      | New + York      | has a '+' symbol               | Cities may only contain letters and spaces. |
      | New _ York      | has a '_' symbol               | Cities may only contain letters and spaces. |
      | New * York      | has a '*' symbol               | Cities may only contain letters and spaces. |
      | São Paulo       | has a non-ASCII symbol         | Cities may only contain letters and spaces. |
      | Nürnberg        | has a non-ASCII symbol         | Cities may only contain letters and spaces. |
      | New York –north | has a non-ASCII en dash symbol | Cities may only contain letters and spaces. |
      | New York —west  | has a non-ASCII em dash symbol | Cities may only contain letters and spaces. |
      | Roppongi 六本木    | has a unicode HAN symbol       | Cities may only contain letters and spaces. |
      | New ✉ York      | has a emoji symbol             | Cities may only contain letters and spaces. |
      | New [ York      | has a '[' symbol               | Cities may only contain letters and spaces. |
      | New ] York      | has a ']' symbol               | Cities may only contain letters and spaces. |

  Scenario: 4b - User focuses on the City input field that has the error "Cities may only contain letters and spaces."
    When I focus on the "city" field
    And I have enter invalid "city" value "New &York" that "has an '&' symbol"
    And I focus on the "street2" field
    And Action detail "Trigger error state - 'Cities may only contain letters and spaces.'"
    And I focus on the "city" field
    Then I shall be displayed an error for the "city" field - "Cities may only contain letters and spaces." in red font color
    And "city" field label is displayed in red
    When I have enter valid "city" value "New York"
    Then "city" field label is displayed in black
    And "city" field input is displayed in black
    And I shall be displayed no error for the "city" field
