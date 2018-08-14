Feature: Last Name - Validation Criteria & Error Handling

  Covers D3F-384
  --------------------
  Validation Criteria:
    - Is a required field
    - Last Name must be between 1 and 25 characters

  not sure if these are valid for this field but I think they are
  - consecutive-special - Input cannot have consecutive special characters
  - Input must begin with a letter- A-Z a-z

  Background:
    Given I am a user on the ex flow
    Given I am on the ex step1 signup page

  Scenario: 1 User enters Legal Last Name that meets the required rules
    When I have enter valid "lastName" value "McSmith"
    And I click on the "step2" field
    Then The "lastName" field border is displayed in green
    And A green checkmark inside the "lastName" field is displayed

  Scenario: 2 System restricts the user from entering more than 25 characters
    When I have enter valid "lastName" value "abcdefghijklmnopqrstuvwx"
    And I click on the "step2" field
    And I shall be displayed no error for the "lastName" field
    Then I enter additional text into "lastName" field text "yzw"
    Then I am restricted from entering more than "25" characters in "lastName" field

  Scenario: 3 User without entering any characters focuses out of the Last Name field
    When I click on the "lastName" field
    And Action detail "however, do not input any value"
    And I click on the "step2" field
    And "lastName" field displays warning Icon
    And "lastName" input field shall be outlined in red

  Scenario: 3a User focuses on the Last Name input field that has the warning icon and enters valid text
    When I click on the "lastName" field
    And Action detail "however, do not input any value"
    And I click on the "step2" field
    When I click on the "lastName" field
    Then I shall be displayed an error for the "lastName" field - "This is a required field"
    Then "lastName" input field shall be black
    Then I enter additional text into "lastName" field text "Codeson"
    And "lastName" field does not display warning Icon
    And "lastName" field displays check Icon
    And "lastName" input field shall be outlined in green

  Scenario: 3b User focuses on the Last Name input field that has the warning icon and enters invalid text
    When I click on the "lastName" field
    And Action detail "however, do not input any value"
    And I click on the "step2" field
    When I click on the "lastName" field
    Then I shall be displayed an error for the "lastName" field - "This is a required field"
    Then "lastName" input field shall be black
    Then I enter additional text into "lastName" field text "3rd"
    And "lastName" field displays warning Icon
    #Then I shall be displayed an error for the "lastName" field

  Scenario: 4 User enters invalid Last Name
    When I have enter invalid "lastName" value "4ork" that "contains a number"
    Then I shall be displayed an error for the "lastName" field - "Please enter a valid name."
    When I click on the "step2" field
    And "lastName" field displays warning Icon
    And "lastName" input field shall be outlined in red
    When I click on the "lastName" field
    Then I shall be displayed an error for the "lastName" field - "Please enter a valid name."

  Scenario: 4a User enters invalid Last Name, and fixes it
    When I have enter invalid "lastName" value "4ork" that "contains a number"
    Then I shall be displayed an error for the "lastName" field - "Please enter a valid name."
    When I click on the "step2" field
    And "lastName" field displays warning Icon
    And "lastName" input field shall be outlined in red
    When I enter additional text into "lastName" field text "{backspace}{backspace}{backspace}{backspace}Jones"
    #And I shall be displayed no error for the "lastName" field
    And "lastName" field does not display warning Icon
    And "lastName" field displays check Icon
    And "lastName" input field shall be outlined in green

  Scenario: 4b User enters invalid Last Name, and it remains invalid
    When I have enter invalid "lastName" value "4ork" that "contains a number"
    Then I shall be displayed an error for the "lastName" field - "Please enter a valid name."
    When I click on the "step2" field
    And "lastName" field displays warning Icon
    And "lastName" input field shall be outlined in red
    When I click on the "lastName" field
    When I enter additional text into "lastName" field text "{backspace}{backspace}{backspace}{backspace}me@dee.da"
    And "lastName" field displays warning Icon
    And "lastName" input field shall be outlined in red
    Then I shall be displayed an error for the "lastName" field - "Please enter a valid name."

 # extended validations
  Scenario: User enters invalid Last Name with multiple special characters
    When I have enter invalid "lastName" value "hal--stone" that "contains a number"
    Then I shall be displayed an error for the "lastName" field - "Please enter a valid name."

  Scenario: User enters invalid Last Name not starting with a letter
    When I have enter invalid "lastName" value "-stone" that "does not begin with a letter"
    Then I shall be displayed an error for the "lastName" field - "YPlease enter a valid name."

  Scenario Outline: User enters an valid lastName
    When I have enter valid "lastName" value "<name_entered>"
    When I focus on the "next-step-button" field
    Then I shall be displayed no errors
    And I shall be displayed no error for the "lastName" field
    Examples:
      | name_entered |
      | Henry        |
      | d'Amore      |
      | mell-any     |
      | D amore      |

  Scenario Outline: User enters an invalid lastName
    When I have enter invalid "lastName" value "<name_entered>" that "<type_of_error>"
    When I focus on the "next-step-button" field
    Then I shall be displayed an error for the "lastName" field - "<error_message>"

    Examples:
      | name_entered     | type_of_error                        | error_message              |
      | mighty77         | contians a number                    | Please enter a valid name. |
      | $mtih            | contains invalid non alpha character | Please enter a valid name. |
      | はると              | contians unicode                     | Please enter a valid name. |
      | userguy@mail.com | does not contain @                   | Please enter a valid name. |
      | smith  jones     | contains two spaces in a row         | Please enter a valid name. |
      | Mc--Mac          | contains two dashes in a row         | Please enter a valid name. |
      | 'Roid            | does not begin with a letter         | Please enter a valid name. |

 #TODO extended special character test, waiting on D3F-41 merge
