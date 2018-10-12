Feature: cfs/step1-fieldValidation-lastName.feature

  Covers
    - CP-402 Desktop/Mobile - CFS - Step 1 Page - Last Name Field
  Validation Criteria
    - Is a required field
    - Last Name must be between 1 and 25 characters
    -consecutive-special - Input cannot have consecutive special characters
    - Input must begin with a letter- A-Z a-z


  Background:
    Given I am a user on the cfs flow
    Given I am on the cfs step1 page


  Scenario: 1 User enters Legal Last Name that meets the required rules
    When I have enter valid "lastName" value "McSmith"
    And I click element "cta-button"
    Then The "lastName" field border shall have a default border

  Scenario: 2 System restricts the user from entering more than 25 characters
    When I have enter valid "lastName" value "abcdefghijklmnopqrstuvwx"
    And I click element "cta-button"
    Then I shall be displayed no error for the "lastName" field
    And I enter additional text into "lastName" field text "yzw"
    And I click element "cta-button"
    And I am restricted from entering more than "25" characters in "lastName" field
    And I shall be displayed no error for the "lastName" field

  Scenario: 3 User without entering any characters focuses out of the Last Name field
    When without entering "lastName"
    And I click element "cta-button"
    And The "lastName" field border is outlined in red color

  Scenario: 3a User focuses on the Last Name input field that is invalid and enters valid text
    When without entering "lastName"
    And I click element "cta-button"
    Then I shall be displayed an error for the "lastName" field - "Last Name is required." in red
    When I enter additional text into "lastName" field text "Codeson"
    And I click element "cta-button"
    Then The "lastName" field border shall have a default border

  Scenario: 3b User focuses on the Last Name input field that is invaid and enters invalid text
    When without entering "lastName"
    And I click element "cta-button"
    Then I shall be displayed an error for the "lastName" field - "Last Name is required." in red
    When I enter additional text into "lastName" field text "3rd"
    And I click element "cta-button"
    And The "lastName" field border is outlined in red color
    Then I shall be displayed an error for the "lastName" field - "Last Name may not begin with or include numbers or special characters." in red

  Scenario: 4 User enters invalid Last Name
    When I have enter invalid "lastName" value "4ork" that "contains a number"
    And I click element "cta-button"
    Then I shall be displayed an error for the "lastName" field - "Last Name may not begin with or include numbers or special characters." in red
    And The "lastName" field border is outlined in red color
    And I click element "cta-button"
    Then I shall be displayed an error for the "lastName" field - "Last Name may not begin with or include numbers or special characters." in red

  Scenario: 4a User enters invalid Last Name, and fixes it
    When I have enter invalid "lastName" value "4ork" that "contains a number"
    And I click element "cta-button"
    Then I shall be displayed an error for the "lastName" field - "Last Name may not begin with or include numbers or special characters." in red
    And The "lastName" field border is outlined in red color
    When I enter additional text into "lastName" field text "{backspace}{backspace}{backspace}{backspace}Jones"
    And I click element "cta-button"
    And I shall be displayed no error for the "lastName" field

  Scenario: 4b User enters invalid Last Name, and it remains invalid
    When I have enter invalid "lastName" value "4ork" that "contains a number"
    And I click element "cta-button"
    Then I shall be displayed an error for the "lastName" field - "Last Name may not begin with or include numbers or special characters." in red
    And The "lastName" field border is outlined in red color
    And I enter additional text into "lastName" field text "{backspace}{backspace}{backspace}{backspace}me@dee.da"
    And The "lastName" field border is outlined in red color
    And I click element "cta-button"
    And I shall be displayed an error for the "lastName" field - "Last Name may not begin with or include numbers or special characters." in red

 # extended validations
  Scenario: User enters invalid Last Name with multiple special characters
    When I have enter invalid "lastName" value "hal--stone" that "contains a number"
    And I click element "cta-button"
    Then I shall be displayed an error for the "lastName" field - "Last Name may not begin with or include numbers or special characters." in red

  Scenario: User enters invalid Last Name not starting with a letter
    When I have enter invalid "lastName" value "-stone" that "does not begin with a letter"
    And I click element "cta-button"
    Then I shall be displayed an error for the "lastName" field - "Last Name may not begin with or include numbers or special characters." in red


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
      | -flash       | does not begin with a letter        | Last Name may not begin with or include numbers or special characters.               |

  Scenario: User enters invalid characters in Last Name multiple input errors
    When I have enter invalid characters "![]&@%?<>!$():;~^{}+=|*ãü木✉" into valid input "Jones" on the "lastName" and I see validation error message "Last Name may not begin with or include numbers or special characters."

  Scenario: User enters additional invalid characters in Last Name multiple input errors
    When I have enter invalid characters ".,#_\/\\\"" into valid input "Jones" on the "lastName" and I see validation error message "Last Name may not begin with or include numbers or special characters."
