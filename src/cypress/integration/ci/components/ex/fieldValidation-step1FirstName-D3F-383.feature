Feature: First Name - Validation Criteria & Error Handling

  Covers
    - D3F-383 First Name - Validation Criteria & Error Handling
  Validation Criteria
    - Is a required field
    - First name must be between 1 and 25 characters.
    - consecutive-special - Input cannot have consecutive special characters
    - Input must begin with a letter- A-Z a-z


  Background:
    Given I am a user on the ex flow
    Given I am on the ex step1 signup page


  Scenario: 1 User enters Legal First Name that meets the required rules
    When I have enter valid "firstName" value "Allan"
    And I blur the "firstName" field
    Then The "firstName" field border is displayed in green
    And A green checkmark inside the "firstName" field is displayed

  Scenario: 2 System restricts the user from entering more than 25 characters
    When I have enter valid "firstName" value "abcdefghijklmnopqrstuvwx"
    And I blur the "firstName" field
    And I shall be displayed no error for the "firstName" field
    Then I enter additional text into "firstName" field text "yzw"
    And I am restricted from entering more than "25" characters in "firstName" field

  Scenario: 3 User without entering any characters focuses out of the First Name field
    When I click on the "firstName" field
    And without entering "firstName"
    And I blur the "firstName" field
    Then "firstName" field displays warning Icon
    And "firstName" input field shall be outlined in red

  Scenario: 3a User focuses on the First Name input field that has the warning icon and enters valid text
    When I click on the "firstName" field
    And without entering "firstName"
    And I blur the "firstName" field
    And I click on the "firstName" field
    Then I shall be displayed an error for the "firstName" field - "This is a required field"
    And "firstName" input field shall be black
    When I enter additional text into "firstName" field text "billy"
    Then "firstName" field does not display warning Icon
    And "firstName" field displays check Icon
    And "firstName" input field shall be outlined in green

  Scenario: 3b User focuses on the First Name input field that has the warning icon and enters invalid text
    When I click on the "firstName" field
    And without entering "firstName"
    And I blur the "firstName" field
    When I click on the "firstName" field
    Then I shall be displayed an error for the "firstName" field - "This is a required field"
    And "firstName" input field shall be black
    When I enter additional text into "firstName" field text "4ork"
    Then "firstName" field displays warning Icon
    #Then I shall be displayed an error for the "firstName" field

  Scenario: 4 User enters invalid First Name
    When I have enter invalid "firstName" value "4ork" that "contains a number"
    Then I shall be displayed an error for the "firstName" field - "You must provide your full, legal first name."
    And I blur the "firstName" field
    And "firstName" field displays warning Icon
    And "firstName" input field shall be outlined in red
    When I click on the "firstName" field
    Then I shall be displayed an error for the "firstName" field - "You must provide your full, legal first name."

  Scenario: 4a User enters invalid First Name, and fixes it
    When I have enter invalid "firstName" value "4ork" that "contains a number"
    #Then I shall be displayed an error for the "firstName" field - "Please enter a valid First Name"
    And I blur the "firstName" field
    Then "firstName" field displays warning Icon
    And "firstName" input field shall be outlined in red
    When I enter additional text into "firstName" field text "{backspace}{backspace}{backspace}{backspace}sally"
    #And I shall be displayed no error for the "firstName" field
    And "firstName" field does not display warning Icon
    And "firstName" field displays check Icon
    And "firstName" input field shall be outlined in green

  Scenario: 4b User enters invalid First Name, and it remains invalid
    When I have enter invalid "firstName" value "4ork" that "contains a number"
    Then I shall be displayed an error for the "firstName" field - "You must provide your full, legal first name."
    When I blur the "firstName" field
    And "firstName" field displays warning Icon
    And "firstName" input field shall be outlined in red
    And I blur the "firstName" field
    And I enter additional text into "firstName" field text "{backspace}{backspace}{backspace}{backspace}me@dee.da"
    Then "firstName" field displays warning Icon
    And "firstName" input field shall be outlined in red
    And I shall be displayed an error for the "firstName" field - "You must provide your full, legal first name."

  # extended validations
  Scenario: User enters invalid First Name with multiple special characters
    When I have enter invalid "firstName" value "hal--stone" that "has consecutive special characters"
    Then I shall be displayed an error for the "firstName" field - "You must provide your full, legal first name."

  Scenario: User enters invalid First Name not starting with a letter
    When I have enter invalid "firstName" value "-stone" that "does not begin with a letter"
    Then I shall be displayed an error for the "firstName" field - "You must provide your full, legal first name."

  Scenario Outline: User enters an valid firstName
    When I have enter valid "firstName" value "<name_entered>"
    And I blur the "firstName" field
    Then I shall be displayed no errors
    And I shall be displayed no error for the "firstName" field

    Examples:
      | name_entered |
      | Henry        |
      | d'Amore      |
      | mell-any     |
      | D amore      |

  Scenario Outline: User enters an invalid firstName
    When I have enter invalid "firstName" value "<name_entered>" that "<type_of_error>"
    And I blur the "firstName" field
    Then I shall be displayed an error for the "firstName" field - "<error_message>"

    Examples:
      | name_entered     | type_of_error                        | error_message              |
      | mighty77         | contians a number                    | Please enter a valid name. |
      | $mtih            | contains invalid non alpha character | Please enter a valid name. |
      | はると              | contians unicode                     | Please enter a valid name. |
      | userguy@mail.com | does not contain @                   | Please enter a valid name. |
      | smith  jones     | contains two spaces in a row         | Please enter a valid name. |
      | Mc--Mac          | contains two dashes in a row         | Please enter a valid name. |
      | 'Roid            | does not begin with a letter         | Please enter a valid name. |

   # performance optimized multi value test
  Scenario: User enters invalid characters in First Name multiple input errors
    When I have enter invalid characters "![]&@%?<>!$():;~^{}+=|_*ãü木✉" into valid input "Katy" on the "firstName" and I see validation error message "Please enter a valid name." on ex flow


