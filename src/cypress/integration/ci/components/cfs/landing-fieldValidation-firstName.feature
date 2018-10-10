Feature: cfs/landing-fieldValidation-firstName.feature

  Covers
    -CP-374 Desktop - CFS - Landing Page First Name Field
  Validation Criteria
    - Is a required field
    - First name must be between 1 and 25 characters.
    - consecutive-special - Input cannot have consecutive special characters
    - Input must begin with a letter- A-Z a-z


  Background:
    Given I am a user on the cfs flow
    Given I am on the cfs landing page


  Scenario: 3 First Name Address Field Border Glow
    When I click on the "firstName" field
    When I focus on the "firstName" field
    #this test is odd should not have to force focus
    Then Check that the "firstName" field is focused
    And The "firstName" field border shall have a highlighted focus border

  Scenario: 5 - User does not enter a First Name
    When without entering "firstName"
    And The "firstName" field border is outlined in red color

  Scenario: 5a- User does not enter a First Name
    And I click element "cta-button"
    And The "firstName" field border is outlined in red color

  Scenario: 1 User enters Legal First Name that meets the required rules
    When I have enter valid "firstName" value "Allan"
    Then The "firstName" field border shall have a default border
    Then I shall be displayed no error for the "firstName" field
    And I click element "cta-button"
    Then The "firstName" field border shall have a default border

  Scenario: 2 System restricts the user from entering more than 25 characters
    When I have enter valid "firstName" value "abcdefghijklmnopqrstuvwx"
    And I shall be displayed no error for the "firstName" field
    Then The "firstName" field border shall have a default border
    Then I enter additional text into "firstName" field text "yzw"
    And I am restricted from entering more than "25" characters in "firstName" field
    And I shall be displayed no error for the "firstName" field
    Then The "firstName" field border shall have a default border

  Scenario: 3a User focuses on the First Name input field that is invalid and enters valid text
    When without entering "firstName"
    #Then I shall be displayed an error for the "firstName" field - "First Name is required."
    And The "firstName" field border is outlined in red color
    When I enter additional text into "firstName" field text "billy"
    Then The "firstName" field border shall have a default border

  Scenario: 3b User focuses on the First Name input field that is invalid enters invalid text
    When without entering "firstName"
    #Then I shall be displayed an error for the "firstName" field - "First Name is required."
    And The "firstName" field border is outlined in red color
    When I enter additional text into "firstName" field text "4ork"
    And The "firstName" field border is outlined in red color
    And I click element "cta-button"
    And The "firstName" field border is outlined in red color

  Scenario: 4 User enters invalid First Name
    When I have enter invalid "firstName" value "4ork" that "contains a number"
    #Then I shall be displayed an error for the "firstName" field - "First Name may not include numbers or special characters."
    And The "firstName" field border is outlined in red color
    And I click element "cta-button"
    And The "firstName" field border is outlined in red color

  Scenario: 4a User enters invalid First Name, and fixes it
    When I have enter invalid "firstName" value "4ork" that "contains a number"
    And The "firstName" field border is outlined in red color
    When I enter additional text into "firstName" field text "{backspace}{backspace}{backspace}{backspace}sally"
    #And I shall be displayed no error for the "firstName" field
    Then The "firstName" field border shall have a default border

  Scenario: 4b User enters invalid First Name, and it remains invalid
    When I have enter invalid "firstName" value "4ork" that "contains a number"
    #Then I shall be displayed an error for the "firstName" field - "First Name may not include numbers or special characters."
    And The "firstName" field border is outlined in red color
    And I enter additional text into "firstName" field text "{backspace}{backspace}{backspace}{backspace}me@dee.da"
    And The "firstName" field border is outlined in red color
    And I click element "cta-button"
    And The "firstName" field border is outlined in red color

  # extended validations
  Scenario: User enters invalid First Name with multiple special characters
    When I have enter invalid "firstName" value "hal--stone" that "has consecutive special characters"
    And I click element "cta-button"
    And The "firstName" field border is outlined in red color

  Scenario: User enters invalid First Name not starting with a letter
    When I have enter invalid "firstName" value "-stone" that "does not begin with a letter"
    And I click element "cta-button"
    And The "firstName" field border is outlined in red color

  Scenario: User enters an valid firstName
    When I have enter valid "firstName" value I do not see the validation error message
      | name_entered |
      | Henry        |
      | d'Amore      |
      | mell-any     |
      | D amore      |

  Scenario: User enters invalid characters in First Name multiple input errors
    When I have enter invalid characters "![]&@%?<>!$():;~^{}+=|*ãü木✉" into valid input "Katy" on the "firstName" and I see validation error message "First Name may not include numbers or special characters."

  Scenario: User enters additional invalid characters in First Name multiple input errors
    When I have enter invalid characters ".,#_\/\\\"" into valid input "Katy" on the "firstName" and I see validation error message "First Name may not include numbers or special characters."


