Feature: Step 2 First Name fields

  Is a required field
  First name must be between 1 and 25 characters.
  consecutive-special - Input cannot have consecutive special characters."
  Middle initial must only be 1 character.
  Input must begin with a letter- A-Z a-z

  - D3F-39 First Name - Validation Criteria & Error Handling
  - D3F-350 Mobile - First Name - Validation Criteria & Error Handling
  - D3F-216 As a user when I hover over an empty form field I am displayed a tooltip inside the input field

  Background:
    Given I am a user on the ck flow
    Given I am on the ck step2 form page


  #D3F-39
  Scenario: 1 User enters Legal First Name that meets the required rules
    When I have enter valid "firstName" value "John"
    When I focus on the "next-step-button" field
    And I shall be displayed no error for the "firstName" field

  Scenario: 2 User without entering any characters focuses out of the First Name field
    When I click on the "firstName" field
    And Action detail "however, do not input any value"
    When I focus on the "next-step-button" field
    Then I shall be displayed an error for the "firstName" field - "This is a required field"
    And "firstName" field label is displayed in red
    And "firstName" field displays X Icon

  Scenario: 2a User without entering any characters focuses out of the First Name field, then clicks the error icon
    When I click on the "firstName" field
    And Action detail "however, do not input any value"
    When I focus on the "next-step-button" field
    Then I shall be displayed an error for the "firstName" field - "This is a required field"
    And "firstName" field label is displayed in red
    And "firstName" field displays X Icon
    And I click the X Icon on the "firstName" field
    Then nothing happens

  Scenario: 2b - 2a User without entering any characters focuses out of the First Name field that has an error, then returns to enter text
    When I click on the "firstName" field
    And Action detail "however, do not input any value"
    When I focus on the "next-step-button" field
    Then I shall be displayed an error for the "firstName" field - "This is a required field"
    And "firstName" field label is displayed in red
    And "firstName" field displays X Icon
    When I click on the "firstName" field
    Then "firstName" field does not display X Icon
    Then I enter additional text into "firstName" field text "ly"
    And I shall be displayed no error for the "firstName" field

  Scenario: 3 User enters invalid First Name
    When I have enter invalid "firstName" value "3#" that "contains a number"
    When I click on the "section-title" field
    Then I shall be displayed an error for the "firstName" field - "Please enter a valid name."
    And "firstName" field label is displayed in red
    And "firstName" field displays X Icon
    And "firstName" field input is displayed in red

  Scenario: 3 User enters invalid First Name
    When I have enter invalid "firstName" value "2" that "contains a number"
    When I click on the "section-title" field
    Then I shall be displayed an error for the "firstName" field - "Please enter a valid name."
    And "firstName" field label is displayed in red
    And "firstName" field displays X Icon
    And "firstName" field input is displayed in red

  Scenario: 3a User enters invalid First Name , then clicks the error icon
    When I have enter invalid "firstName" value "1" that "contains a number"
    When I click on the "section-title" field
    Then I shall be displayed an error for the "firstName" field - "Please enter a valid name."
    And "firstName" field label is displayed in red
    And "firstName" field displays X Icon
    And "firstName" field input is displayed in red
    And I click the X Icon on the "firstName" field
    Then nothing happens

  Scenario: 3b User enters invalid First Name, and fixes it
    When I have enter invalid "firstName" value "4ork" that "that contains a number"
    When I click on the "section-title" field
    Then I shall be displayed an error for the "firstName" field - "Please enter a valid name."
    And "firstName" field label is displayed in red
    And "firstName" field displays X Icon
    And "firstName" field input is displayed in red
    Then I enter additional text into "firstName" field text "ly"
    And I shall be displayed no error for the "firstName" field
    When I have enter valid "firstName" value "fork-spelled-with-four"
    And "firstName" field label is displayed in black
    And I shall be displayed no error for the "firstName" field

  Scenario: 4 System restricts the user from entering more than 25 characters
    When I have enter valid "firstName" value "abcdefghijklmnopqrstuvwx"
    When I focus on the "next-step-button" field
    And I shall be displayed no error for the "firstName" field
    Then I enter additional text into "firstName" field text "yzw"
    Then I am restricted from entering more than "25" characters in "firstName" field

  #D3F-216
  Scenario: 5 - User hovers over an pristine empty First Name input field
    And Action detail "however, do not input any value"
    When I hover over "firstName" address
    Then I am displayed a attribute title on "firstName" field - "Please fill out this field."

  Scenario: 5a - User hovers over an empty First Name input field with error
    When I click on the "firstName" field
    And Action detail "however, do not input any value"
    When I focus on the "next-step-button" field
    When I hover over "firstName" address
    Then I am displayed a attribute title on "firstName" field - "Please fill out this field."

  Scenario Outline: User enters an valid email
    When I have enter valid "firstName" value "<name_entered>"
    When I focus on the "next-step-button" field
    Then I shall be displayed no errors
    And I shall be displayed no error for the "firstName" field
    Examples:
      | name_entered |
      | Henry        |
      | d'Amore      |
      | mell-any     |
      | D amore      |

  Scenario Outline: User enters an invalid email
    When I have enter invalid "firstName" value "<name_entered>" that "<type_of_error>"
    When I focus on the "next-step-button" field
    Then I shall be displayed an error for the "firstName" field - "<error_message>"

    Examples:
      | name_entered      | type_of_error                        | error_message              |
      | mighty77          | contians a number                    | Please enter a valid name. |
      | $mtih             | contains invalid non alpha character | Please enter a valid name. |
      | はると              | contians unicode                     | Please enter a valid name. |
      | userguy@mail.com  | does not contain @                   | Please enter a valid name. |
      | Jimmy  John       | contains two spaces in a row         | Please enter a valid name. |
      | Ilike--mdash      | contains two dashes in a row         | Please enter a valid name. |
