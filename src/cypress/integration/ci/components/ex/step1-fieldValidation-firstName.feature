Feature: ex/step1-fieldValidation-firstName.feature

  Covers
    - CP-803 (D3F-383) First Name - Validation Criteria & Error Handling
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
    Then The "firstName" field border is displayed in green
    And A green checkmark inside the "firstName" field is displayed
    Then I shall be displayed no error for the "firstName" field

  Scenario: 2 System restricts the user from entering more than 25 characters
    When I have enter valid "firstName" value "abcdefghijklmnopqrstuvwx"
    And I shall be displayed no error for the "firstName" field
    Then I enter additional text into "firstName" field text "yzw"
    And I am restricted from entering more than "25" characters in "firstName" field
    And I shall be displayed no error for the "firstName" field

  Scenario: 3 User without entering any characters focuses out of the First Name field
    When without entering "firstName"
    Then "firstName" field displays warning Icon
    And "firstName" input field shall be outlined in red

  Scenario: 3a User focuses on the First Name input field that has the warning icon and enters valid text
    When without entering "firstName"
    Then I shall be displayed an error for the "firstName" field - "First Name is required."
    And "firstName" input field shall be black
    When I enter additional text into "firstName" field text "billy"
    Then "firstName" field does not display warning Icon
    And "firstName" field displays check Icon
    And "firstName" input field shall be outlined in green

  Scenario: 3b User focuses on the First Name input field that has the warning icon and enters invalid text
    When without entering "firstName"
    Then I shall be displayed an error for the "firstName" field - "First Name is required."
    And "firstName" input field shall be black
    When I enter additional text into "firstName" field text "4ork"
    Then "firstName" field displays warning Icon
    #Then I shall be displayed an error for the "firstName" field

  Scenario: 4 User enters invalid First Name
    When I have enter invalid "firstName" value "4ork" that "contains a number"
    Then I shall be displayed an error for the "firstName" field - "First Name may not include numbers or special characters."
    And "firstName" field displays warning Icon
    And "firstName" input field shall be outlined in red
    Then I shall be displayed an error for the "firstName" field - "First Name may not include numbers or special characters."

  Scenario: 4a User enters invalid First Name, and fixes it
    When I have enter invalid "firstName" value "4ork" that "contains a number"
    #Then I shall be displayed an error for the "firstName" field - "First Name may not include numbers or special characters."
    Then "firstName" field displays warning Icon
    And "firstName" input field shall be outlined in red
    When I enter additional text into "firstName" field text "{backspace}{backspace}{backspace}{backspace}sally"
    #And I shall be displayed no error for the "firstName" field
    And "firstName" field does not display warning Icon
    And "firstName" field displays check Icon
    And "firstName" input field shall be outlined in green

  Scenario: 4b User enters invalid First Name, and it remains invalid
    When I have enter invalid "firstName" value "4ork" that "contains a number"
    Then I shall be displayed an error for the "firstName" field - "First Name may not include numbers or special characters."
    And "firstName" field displays warning Icon
    And "firstName" input field shall be outlined in red
    And I enter additional text into "firstName" field text "{backspace}{backspace}{backspace}{backspace}me@dee.da"
    Then "firstName" field displays warning Icon
    And "firstName" input field shall be outlined in red
    And I shall be displayed an error for the "firstName" field - "First Name may not include numbers or special characters."

  # extended validations
  Scenario: User enters invalid First Name with multiple special characters
    When I have enter invalid "firstName" value "hal--stone" that "has consecutive special characters"
    Then I shall be displayed an error for the "firstName" field - "First Name may not include numbers or special characters."

  Scenario: User enters invalid First Name not starting with a letter
    When I have enter invalid "firstName" value "-stone" that "does not begin with a letter"
    Then I shall be displayed an error for the "firstName" field - "First Name may not include numbers or special characters."

  Scenario: User enters an valid firstName
    When I have enter valid "firstName" value I do not see the validation error message
      | name_entered |
      | Henry        |
      | d'Amore      |
      | mell-any     |
      | D amore      |

  Scenario: User enters an invalid firstName
    When I have enter invalid "firstName" value I see the correct validation error message
      | name_entered     | type_of_error                        | error_message              |
      | mighty77         | contians a number                    | First Name may not include numbers or special characters. |
      | smith  jones     | contains two spaces in a row         | First Name may not include numbers or special characters. |
      | Mc--Mac          | contains two dashes in a row         | First Name may not include numbers or special characters. |
      | 'Roid            | does not begin with a letter         | First Name may not include numbers or special characters. |

  Scenario: User enters invalid characters in First Name multiple input errors
    When I have enter invalid characters "![]&@%?<>!$():;~^{}+=|*ãü木✉" into valid input "Katy" on the "firstName" and I see validation error message "First Name may not include numbers or special characters."

  Scenario: User enters additional invalid characters in First Name multiple input errors
    When I have enter invalid characters ".,#_\/\\\"" into valid input "Katy" on the "firstName" and I see validation error message "First Name may not include numbers or special characters."


