Feature: ck/step2-fieldValidation-firstName.feature

  Covers
    - D3F-39 First Name - Validation Criteria & Error Handling
    - D3F-350 Mobile - First Name - Validation Criteria & Error Handling
    - D3F-216 As a user when I hover over an empty form field I am displayed a tooltip inside the input field
  Validation Criteria
    - Is a required field
    - First name must be between 1 and 25 characters.
    - consecutive-special - Input cannot have consecutive special characters.
    - Input must begin with a letter- A-Z a-z


  Background:
    Given I am a user on the ck flow
    Given I am on the ck step2 form page


  Scenario: 1 User enters Legal First Name that meets the required rules
    When I have enter valid "firstName" value "John"
    Then I shall be displayed no error for the "firstName" field

  Scenario: 2 System restricts the user from entering more than 25 characters
    When I have enter valid "firstName" value "abcdefghijklmnopqrstuvwx"
    And I shall be displayed no error for the "firstName" field
    Then I enter additional text into "firstName" field text "yzw"
    Then I am restricted from entering more than "25" characters in "firstName" field
    And I shall be displayed no error for the "firstName" field

  Scenario: 3 User without entering any characters focuses out of the First Name field
    When without entering "firstName"
    Then I shall be displayed an error for the "firstName" field - "First Name is required"
    And "firstName" field label is displayed in red
    And "firstName" field displays X Icon

  Scenario: 3a User without entering any characters focuses out of the First Name field, then clicks the error icon
    When without entering "firstName"
    Then I shall be displayed an error for the "firstName" field - "First Name is required"
    And "firstName" field displays X Icon
    When I click the X Icon on the "firstName" field
    Then Check that the "firstName" field is not focused

  Scenario: 3b User without entering any characters focuses out of the First Name field that has an error, then returns to enter text
    When without entering "firstName"
    Then I shall be displayed an error for the "firstName" field - "First Name is required"
    And "firstName" field label is displayed in red
    And "firstName" field displays X Icon
    When I click on the "firstName" field
    Then "firstName" field does not display X Icon
    When I enter additional text into "firstName" field text "ly"
    Then I shall be displayed no error for the "firstName" field

  Scenario: 3c User focuses back on valid firstname field and enters invalid text
    When I have enter valid "firstName" value "John"
    And I enter additional text into "firstName" field text " (the dude)"
    And I blur the "firstName" field
    Then I shall be displayed an error for the "firstName" field - "First Name may not include numbers or special characters."

  Scenario: 3d User focuses back on the first name field that has the error and backspaces
    When I have enter invalid "firstName" value "4ork" that "contains a number"
    And I shall be displayed an error for the "firstName" field - "First Name may not include numbers or special characters."
    And I enter additional text into "firstName" field text "{backspace}"
    Then I shall be displayed no error for the "firstName" field

  Scenario: 4 User enters invalid First Name with number
    When I have enter invalid "firstName" value "4ork" that "contains a number"
    Then I shall be displayed an error for the "firstName" field - "First Name may not include numbers or special characters."
    And "firstName" field label is displayed in red
    And "firstName" field displays X Icon
    And "firstName" input field is displayed in red

  Scenario: 4a User enters invalid First Name , then clicks the error icon
    When I have enter invalid "firstName" value "1" that "contains a number"
    Then I shall be displayed an error for the "firstName" field - "First Name may not include numbers or special characters."
    When I blur the "firstName" field
    And I click the X Icon on the "firstName" field
    Then Check that the "firstName" field is not focused

  Scenario: 4b User enters invalid First Name, and fixes it
    When I have enter invalid "firstName" value "4ork" that "that contains a number"
    Then I shall be displayed an error for the "firstName" field - "First Name may not include numbers or special characters."
    When I enter additional text into "firstName" field text "{backspace}{backspace}{backspace}{backspace}sally"
    And I shall be displayed no error for the "firstName" field
    Then "firstName" field label is displayed in black
    And I blur the "firstName" field
    And I shall be displayed no error for the "firstName" field

  #D3F-216
  Scenario: 5 User hovers over an pristine empty First Name input field
    When without entering "firstName"
    And I hover over "firstName"
    Then I am displayed a attribute title on "firstName" field - "Please fill out this field."

  Scenario: 5a User hovers over an empty First Name input field with error
    When without entering "firstName"
    And I hover over "firstName"
    Then I am displayed a attribute title on "firstName" field - "Please fill out this field."

  # extended validations
  Scenario: User enters invalid First Name with multiple special characters
    When I have enter invalid "firstName" value "hal--stone" that "contains a number"
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
      | name_entered      | type_of_error                        | error_message                                             |
      | mighty77          | contians a number                    | First Name may not include numbers or special characters. |
      | Ilike--mdash      | contains two dashes in a row         | First Name may not include numbers or special characters. |
      | d''art            | contains two single quotes in a row  | First Name may not include numbers or special characters. |
      | 'Roid             | does not begin with a letter         | First Name may not include numbers or special characters. |
      | -flash            | does not begin with a letter         | First Name may not include numbers or special characters. |
      | Jimmy  John       | contains two spaces in a row         | First Name may not include numbers or special characters. |

  Scenario: User enters invalid characters in First Name multiple input errors
    When I have enter invalid characters "![]&@%?<>!$():;~^{}+=|*ãü木✉" into valid input "Katy" on the "firstName" and I see validation error message "First Name may not include numbers or special characters."

  Scenario: User enters additional invalid characters in First Name multiple input errors
    When I have enter invalid characters ".,#_\/\\\"" into valid input "Katy" on the "firstName" and I see validation error message "First Name may not include numbers or special characters."
