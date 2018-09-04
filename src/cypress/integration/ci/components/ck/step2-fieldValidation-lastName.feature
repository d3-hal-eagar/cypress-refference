Feature: Step 2 Last Name fields

  Covers
    - D3F-40 Last Name - Validation Criteria & Error Handling
    - D3F-357 Mobile - Last Name - Validation Criteria & Error Handling
  Validation Criteria
    - Is a required field
    - Last name must be between 1 and 25 characters.
    - consecutive-special - Input cannot have consecutive special characters.
    - Input must begin with a letter- A-Z a-z


  Background:
    Given I am a user on the ck flow
    Given I am on the ck step2 form page


  #D3F-40
  Scenario: 1 User enters Legal First Name that meets the required rules
    When I have enter valid "lastName" value "Smith"
    And I blur the "lastName" field
    Then I shall be displayed no error for the "lastName" field

  Scenario: 2 User without entering any characters focuses out of the First Name field
    When I click on the "lastName" field
    And without entering "lastName"
    And I blur the "lastName" field
    Then I shall be displayed an error for the "lastName" field - "This is a required field"
    And "lastName" field label is displayed in red
    And "lastName" field displays X Icon

  Scenario: 2a User without entering any characters focuses out of the First Name field, then clicks the error icon
    When I click on the "lastName" field
    When without entering "lastName"
    And I blur the "lastName" field
    Then I shall be displayed an error for the "lastName" field - "This is a required field"
    When I click the X Icon on the "lastName" field
    Then Check that the "lastName" field is not focused


  Scenario: 2b - 2a User without entering any characters focuses out of the First Name field that has an error, then returns to enter text
    When I click on the "lastName" field
    And without entering "lastName"
    And I blur the "lastName" field
    Then I shall be displayed an error for the "lastName" field - "This is a required field"
    And "lastName" field label is displayed in red
    And "lastName" field displays X Icon
    When I click on the "lastName" field
    Then "lastName" field does not display X Icon
    And I enter additional text into "lastName" field text "ly"
    And I shall be displayed no error for the "lastName" field

  Scenario: 3 User enters invalid First Name with symbol
    When I have enter invalid "lastName" value "#" that "contains a symbol"
    And I blur the "lastName" field
    Then I shall be displayed an error for the "lastName" field - "Please enter a valid last name."
    And "lastName" field label is displayed in red
    And "lastName" field displays X Icon
    And "lastName" input field is displayed in red

  Scenario: 3 User enters invalid First Name with number
    When I have enter invalid "lastName" value "2" that "contains a number"
    And I blur the "lastName" field
    Then I shall be displayed an error for the "lastName" field - "Please enter a valid name."
    And "lastName" field label is displayed in red
    And "lastName" field displays X Icon
    And "lastName" input field is displayed in red

  Scenario: 3a User enters invalid First Name, then clicks the error icon
    When I have enter invalid "lastName" value "1" that "contains a number"
    And I blur the "lastName" field
    Then I shall be displayed an error for the "lastName" field - "Please enter a valid name."
    When I click the X Icon on the "lastName" field
    Then Check that the "lastName" field is not focused

  Scenario: 3b User enters invalid First Name, and fixes it
    When I have enter invalid "lastName" value "4ork" that "that contains a number"
    And I blur the "lastName" field
    Then I shall be displayed an error for the "lastName" field - "Please enter a valid name."
    When I enter additional text into "lastName" field text "ly"
    Then I shall be displayed no error for the "lastName" field
    When I have enter valid "lastName" value "fork-spelled-with-four"
    And "lastName" field label is displayed in black
    And I shall be displayed no error for the "lastName" field

  Scenario: 4 System restricts the user from entering more than 25 characters
    When I have enter valid "lastName" value "abcdefghijklmnopqrstuvwx"
    And I blur the "lastName" field
    And I shall be displayed no error for the "lastName" field
    When I enter additional text into "lastName" field text "yzw"
    Then I am restricted from entering more than "25" characters in "lastName" field

  Scenario: 5 - User hovers over an pristine empty Last Name input field
    When without entering "lastName"
    And I hover over "lastName"
    Then I am displayed a attribute title on "lastName" field - "Please fill out this field."

  Scenario: 5a - User hovers over an empty Last Name input field with error
    When I click on the "lastName" field
    And without entering "lastName"
    And I blur the "lastName" field
    And I hover over "lastName"
    Then I am displayed a attribute title on "lastName" field - "Please fill out this field."

  # extended validations
  Scenario: User enters invalid Last Name with multiple special characters
    When I have enter invalid "lastName" value "hal--stone" that "contains a number"
    And I blur the "lastName" field
    Then I shall be displayed an error for the "lastName" field - "Please enter a valid name."

  Scenario: User enters invalid Last Name not starting with a letter
    When I have enter invalid "lastName" value "-stone" that "does not begin with a letter"
    And I blur the "lastName" field
    Then I shall be displayed an error for the "lastName" field - "Please enter a valid name."

  Scenario Outline: User enters an valid lastName
    When I have enter valid "lastName" value "<name_entered>"
    And I blur the "lastName" field
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
    And I blur the "lastName" field
    Then I shall be displayed an error for the "lastName" field - "<error_message>"

    Examples:
      | name_entered     | type_of_error                        | error_message              |
      | mighty77         | contians a number                    | Please enter a valid name. |
      | smith  jones     | contains two spaces in a row         | Please enter a valid name. |
      | Mc--Mac          | contains two dashes in a row         | Please enter a valid name. |
      | 'Roid            | does not begin with a letter         | Please enter a valid name. |

  Scenario: User enters invalid characters in Last Name multiple input errors
    When I have enter invalid characters "![]&@%?<>!$():;~^{}+=|_*ãü木✉" into valid input "Jones" on the "lastName" and I see validation error message "Please enter a valid last name."

   Scenario: User enters additional invalid characters in Last Name multiple input errors
    When I have enter invalid characters ".,#\//\"" into valid input "Jones" on the "lastName" and I see validation error message "Please enter a valid last name."
