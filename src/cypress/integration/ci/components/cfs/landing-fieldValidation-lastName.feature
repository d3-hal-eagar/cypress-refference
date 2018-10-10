Feature: cfs/landing-fieldValidation-lastName.feature

  Covers
    -CP-493 Desktop - CFS - Landing Page Last Name Field
  Validation Criteria
    - Is a required field
    - Last Name must be between 1 and 25 characters
    -consecutive-special - Input cannot have consecutive special characters
    - Input must begin with a letter- A-Z a-z


  Background:
    Given I am a user on the cfs flow
    Given I am on the cfs landing page


  Scenario: 3 Last Name Address Field Border Glow
    When I click on the "lastName" field
    When I focus on the "lastName" field
    Then Check that the "lastName" field is focused
    And The "lastName" field border shall have a highlighted focus border

  Scenario: 5 - User does not enter a Last Name
    When without entering "lastName"
    And The "lastName" field border is outlined in red color

  Scenario: 5a- User does not enter a Last Name
    And I click element "cta-button"
    And The "lastName" field border is outlined in red color

  Scenario: 1 User enters Legal Last Name that meets the required rules
    When I have enter valid "lastName" value "McSmith"
    Then The "lastName" field border shall have a default border
    And I click element "cta-button"
    Then The "lastName" field border shall have a default border

  Scenario: 2 System restricts the user from entering more than 25 characters
    When I have enter valid "lastName" value "abcdefghijklmnopqrstuvwx"
    Then I shall be displayed no error for the "lastName" field
    Then The "lastName" field border shall have a default border
    And I enter additional text into "lastName" field text "yzw"
    And I am restricted from entering more than "25" characters in "lastName" field
    And I shall be displayed no error for the "lastName" field
    Then The "lastName" field border shall have a default border

  Scenario: 3a User focuses on the Last Name input field that is invalid and enters valid text
    When without entering "lastName"
    #Then I shall be displayed an error for the "lastName" field - "Last Name is required."
    When I enter additional text into "lastName" field text "Codeson"
    Then The "lastName" field border shall have a default border

  Scenario: 3b User focuses on the Last Name input field that is invaid and enters invalid text
    When without entering "lastName"
    #Then I shall be displayed an error for the "lastName" field - "Last Name is required."
    When I enter additional text into "lastName" field text "3rd"
    And The "lastName" field border is outlined in red color
    #Then I shall be displayed an error for the "lastName" field

  Scenario: 4 User enters invalid Last Name
    When I have enter invalid "lastName" value "4ork" that "contains a number"
    #Then I shall be displayed an error for the "lastName" field - "Last Name may not begin with or include numbers or special characters."
    And The "lastName" field border is outlined in red color
    And I click element "cta-button"
    And The "lastName" field border is outlined in red color

  Scenario: 4a User enters invalid Last Name, and fixes it
    When I have enter invalid "lastName" value "4ork" that "contains a number"
    #Then I shall be displayed an error for the "lastName" field - "Last Name may not begin with or include numbers or special characters."
    And The "lastName" field border is outlined in red color
    When I enter additional text into "lastName" field text "{backspace}{backspace}{backspace}{backspace}Jones"
    #And I shall be displayed no error for the "lastName" field
    Then The "lastName" field border shall have a default border

  Scenario: 4b User enters invalid Last Name, and it remains invalid
    When I have enter invalid "lastName" value "4ork" that "contains a number"
    #Then I shall be displayed an error for the "lastName" field - "Last Name may not begin with or include numbers or special characters."
    And The "lastName" field border is outlined in red color
    And I enter additional text into "lastName" field text "{backspace}{backspace}{backspace}{backspace}me@dee.da"
    And The "lastName" field border is outlined in red color
    And I click element "cta-button"
    And The "lastName" field border is outlined in red color

 # extended validations
  Scenario: User enters invalid Last Name with multiple special characters
    When I have enter invalid "lastName" value "hal--stone" that "contains a number"
    And I click element "cta-button"
    And The "lastName" field border is outlined in red color

  Scenario: User enters invalid Last Name not starting with a letter
    When I have enter invalid "lastName" value "-stone" that "does not begin with a letter"
    And I click element "cta-button"
    And The "lastName" field border is outlined in red color

  Scenario: User enters an valid lastName
    When I have enter valid "lastName" value I do not see the validation error message
      | name_entered |
      | Henry        |
      | d'Amore      |
      | mell-any     |
      | D amore      |

  Scenario: User enters invalid characters in Last Name multiple input errors
    When I have enter invalid characters "![]&@%?<>!$():;~^{}+=|*ãü木✉" into valid input "Jones" on the "lastName" and I see validation error message "Last Name may not begin with or include numbers or special characters."

  Scenario: User enters additional invalid characters in Last Name multiple input errors
    When I have enter invalid characters ".,#_\/\\\"" into valid input "Jones" on the "lastName" and I see validation error message "Last Name may not begin with or include numbers or special characters."
