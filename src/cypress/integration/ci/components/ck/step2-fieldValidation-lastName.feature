Feature: ck/step2-fieldValidation-lastName.feature

  Covers
    - CP-810 (D3F-40) Last Name - Validation Criteria & Error Handling
    - CP-793 (D3F-357) Mobile - Last Name - Validation Criteria & Error Handling
  Validation Criteria
    - Is a required field
    - Last name must be between 1 and 25 characters.
    - consecutive-special - Input cannot have consecutive special characters.
    - Input must begin with a letter- A-Z a-z


  Background:
    Given I am a user on the ck flow
    Given I am on the ck step2 form page


  #D3F-40
  Scenario: 1 User enters Legal last Name that meets the required rules
    When I have enter valid "lastName" value "Smith"
    Then I shall be displayed no error for the "lastName" field

  Scenario: 2 System restricts the user from entering more than 25 characters
    When I have enter valid "lastName" value "abcdefghijklmnopqrstuvwx"
    And I shall be displayed no error for the "lastName" field
    When I enter additional text into "lastName" field text "yzw"
    Then I am restricted from entering more than "25" characters in "lastName" field
    And I shall be displayed no error for the "lastName" field

  Scenario: 3 User without entering any characters focuses out of the Last Name field
    When without entering "lastName"
    Then I shall be displayed an error for the "lastName" field - "Last Name is required"
    And "lastName" field label is displayed in red
    And "lastName" field displays X Icon

  Scenario: 3a User without entering any characters focuses out of the Last Name field, then clicks the error icon
    When without entering "lastName"
    Then I shall be displayed an error for the "lastName" field - "Last Name is required"
    And "lastName" field displays X Icon
    When I click the X Icon on the "lastName" field
    Then Check that the "lastName" field is not focused

  Scenario: 3b User without entering any characters focuses out of the Last Name field that has an error, then returns to enter text
    When without entering "lastName"
    Then I shall be displayed an error for the "lastName" field - "Last Name is required"
    And "lastName" field label is displayed in red
    And "lastName" field displays X Icon
    When I click on the "lastName" field
    Then "lastName" field does not display X Icon
    And I enter additional text into "lastName" field text "ly"
    And I shall be displayed no error for the "lastName" field

  Scenario: 3c User focuses back on valid lastname field and enters invalid text
    When I have enter valid "lastName" value "Smith"
    And I enter additional text into "lastName" field text " (the dude)"
    And I blur the "lastName" field
    Then I shall be displayed an error for the "lastName" field - "Last Name may not begin with or include numbers or special characters."

  Scenario: 3d User focuses back on the last name field that has the error and backspaces
    When I have enter invalid "lastName" value "doctor$" that "contains a symbol"
    And I shall be displayed an error for the "lastName" field - "Last Name may not begin with or include numbers or special characters."
    And I enter additional text into "lastName" field text "{backspace}"
    Then I shall be displayed no error for the "lastName" field

  Scenario: 4 User enters invalid Last Name with symbol
    When I have enter invalid "lastName" value "#" that "contains a symbol"
    Then I shall be displayed an error for the "lastName" field - "Last Name may not begin with or include numbers or special characters."
    And "lastName" field label is displayed in red
    And "lastName" field displays X Icon
    And "lastName" input field is displayed in red

  Scenario: 4a User enters invalid last Name with number
    When I have enter invalid "lastName" value "2" that "contains a number"
    Then I shall be displayed an error for the "lastName" field - "Last Name may not begin with or include numbers or special characters."
    And "lastName" field label is displayed in red
    And "lastName" field displays X Icon
    And "lastName" input field is displayed in red

  Scenario: 4b User enters invalid last Name, then clicks the error icon
    When I have enter invalid "lastName" value "1" that "contains a number"
    Then I shall be displayed an error for the "lastName" field - "Last Name may not begin with or include numbers or special characters."
    And I blur the "lastName" field
    When I click the X Icon on the "lastName" field
    Then Check that the "lastName" field is not focused

  Scenario: 4c User enters invalid last Name, and fixes it
    When I have enter invalid "lastName" value "4ork" that "that contains a number"
    Then I shall be displayed an error for the "lastName" field - "Last Name may not begin with or include numbers or special characters."
    When I enter additional text into "lastName" field text "{backspace}{backspace}{backspace}{backspace}fork-spelled-with-four"
    Then "lastName" field label is displayed in black
    And I shall be displayed no error for the "lastName" field
    When I blur the "lastName" field
    Then I shall be displayed no error for the "lastName" field

  Scenario: 5 User hovers over an pristine empty Last Name input field
    When without entering "lastName"
    And I hover over "lastName"
    Then I am displayed a attribute title on "lastName" field - "Please fill out this field."

  Scenario: 5a User hovers over an empty Last Name input field with error
    When without entering "lastName"
    And I hover over "lastName"
    Then I am displayed a attribute title on "lastName" field - "Please fill out this field."

  # extended validations
  Scenario: User enters invalid Last Name with multiple special characters
    When I have enter invalid "lastName" value "hal--stone" that "contains a number"
    Then I shall be displayed an error for the "lastName" field - "Last Name may not begin with or include numbers or special characters."

  Scenario: User enters invalid Last Name not starting with a letter
    When I have enter invalid "lastName" value "-stone" that "does not begin with a letter"
    Then I shall be displayed an error for the "lastName" field - "Last Name may not begin with or include numbers or special characters."

  Scenario: User enters an valid lastName
    When I have enter valid "lastName" value I do not see the validation error message
      | name_entered |
      | Henry        |
      | d'Amore      |
      | mell-any     |
      | D amore      |

  Scenario: User enters an invalid lastName
    When I have enter invalid "lastName" value I see the correct validation error message
      | name_entered | type_of_error                       | error_message                                                          |
      | mighty77     | contains a number                   | Last Name may not begin with or include numbers or special characters. |
      | smith  jones | contains two spaces in a row        | Last Name may not begin with or include numbers or special characters. |
      | Mc--Mac      | contains two dashes in a row        | Last Name may not begin with or include numbers or special characters. |
      | d''art       | contains two single quotes in a row | Last Name may not begin with or include numbers or special characters. |
      | 'Roid        | does not begin with a letter        | Last Name may not begin with or include numbers or special characters. |
      | -flash       | does not begin with a letter        | Last Name may not begin with or include numbers or special characters. |

  Scenario: User enters invalid characters in Last Name multiple input errors
    When I have enter invalid characters "![]&@%?<>!$():;~^{}+=|*ãü木✉" into valid input "Jones" on the "lastName" and I see validation error message "Last Name may not begin with or include numbers or special characters."

   Scenario: User enters additional invalid characters in Last Name multiple input errors
    When I have enter invalid characters ".,#_\/\\\"" into valid input "Jones" on the "lastName" and I see validation error message "Last Name may not begin with or include numbers or special characters."
