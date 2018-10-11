Feature: cfs/step1-fieldValidation-firstName.feature

  Covers
    - CP-310 Desktop/Mobile - CFS - Step 1 Page - First Name Field

  Validation Criteria
    - Is a required field
    - First name must be between 1 and 25 characters.
    - consecutive-special - Input cannot have consecutive special characters
    - Input must begin with a letter- A-Z a-z


  Background:
    Given I am a user on the cfs flow
    Given I am on the cfs step1 page


  Scenario: 1 User enters Legal First Name that meets the required rules
    When I have enter valid "firstName" value "Allan"
    And I click element "cta-button"
    Then I shall be displayed no error for the "firstName" field

  Scenario: 2 System restricts the user from entering more than 25 characters
    When I have enter valid "firstName" value "abcdefghijklmnopqrstuvwx"
    And I click element "cta-button"
    And I shall be displayed no error for the "firstName" field
    Then I enter additional text into "firstName" field text "yzw"
    And I am restricted from entering more than "25" characters in "firstName" field
    And I click element "cta-button"
    And I shall be displayed no error for the "firstName" field

  Scenario: 3 User without entering any characters focuses out of the First Name field
    When without entering "firstName"
    #no validations until click
    And I click element "cta-button"
    And The "firstName" field border is outlined in red color
    Then I shall be displayed an error for the "firstName" field - "First Name is required." in red


  Scenario: 3a User focuses on the First Name input field that is invalid and enters valid text
    When without entering "firstName"
    And I click element "cta-button"
    Then I shall be displayed an error for the "firstName" field - "First Name is required." in red
    And The "firstName" field border is outlined in red color
    When I enter additional text into "firstName" field text "billy"
    And I click element "cta-button"
    Then The "firstName" field border shall have a default border

  Scenario: 3b User focuses on the First Name input field that is invalid enters invalid text
    When without entering "firstName"
    And I click element "cta-button"
    Then I shall be displayed an error for the "firstName" field - "First Name is required." in red
    And The "firstName" field border is outlined in red color
    When I enter additional text into "firstName" field text "4ork"
    And The "firstName" field border is outlined in red color
    And I click element "cta-button"
    Then I shall be displayed an error for the "firstName" field - "First Name may not include numbers or special characters." in red

  Scenario: 4 User enters invalid First Name
    When I have enter invalid "firstName" value "4ork" that "contains a number"
    And I click element "cta-button"
    Then I shall be displayed an error for the "firstName" field - "First Name may not include numbers or special characters." in red
    And The "firstName" field border is outlined in red color
    And I click element "cta-button"
    Then I shall be displayed an error for the "firstName" field - "First Name may not include numbers or special characters." in red

  Scenario: 4a User enters invalid First Name, and fixes it
    When I have enter invalid "firstName" value "4ork" that "contains a number"
    And I click element "cta-button"
    And The "firstName" field border is outlined in red color
    When I enter additional text into "firstName" field text "{backspace}{backspace}{backspace}{backspace}sally"
    And I click element "cta-button"
    And I shall be displayed no error for the "firstName" field
    Then The "firstName" field border shall have a default border

  Scenario: 4b User enters invalid First Name, and it remains invalid
    When I have enter invalid "firstName" value "4ork" that "contains a number"
    And I click element "cta-button"
    Then I shall be displayed an error for the "firstName" field - "First Name may not include numbers or special characters." in red
    And The "firstName" field border is outlined in red color
    And I enter additional text into "firstName" field text "{backspace}{backspace}{backspace}{backspace}me@dee.da"
    And I click element "cta-button"
    And The "firstName" field border is outlined in red color
    And I shall be displayed an error for the "firstName" field - "First Name may not include numbers or special characters." in red

  # extended validations
  Scenario: User enters invalid First Name with multiple special characters
    When I have enter invalid "firstName" value "hal--stone" that "has consecutive special characters"
    And I click element "cta-button"
    Then I shall be displayed an error for the "firstName" field - "First Name may not include numbers or special characters." in red

  Scenario: User enters invalid First Name not starting with a letter
    When I have enter invalid "firstName" value "-stone" that "does not begin with a letter"
    And I click element "cta-button"
    Then I shall be displayed an error for the "firstName" field - "First Name may not include numbers or special characters." in red

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
      | mighty77         | contains a number                    | First Name may not include numbers or special characters. |
      | smith  jones     | contains two spaces in a row         | First Name may not include numbers or special characters. |
      | Mc--Mac          | contains two dashes in a row         | First Name may not include numbers or special characters. |
      | 'Roid            | does not begin with a letter         | First Name may not include numbers or special characters. |

  Scenario: User enters invalid characters in First Name multiple input errors
    When I have enter invalid characters "![]&@%?<>!$():;~^{}+=|*ãü木✉" into valid input "Katy" on the "firstName" and I see validation error message "First Name may not include numbers or special characters."

  Scenario: User enters additional invalid characters in First Name multiple input errors
    When I have enter invalid characters ".,#_\/\\\"" into valid input "Katy" on the "firstName" and I see validation error message "First Name may not include numbers or special characters."


