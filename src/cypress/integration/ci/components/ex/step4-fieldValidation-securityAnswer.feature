Feature: Security Answer - Validation Criteria & Error Handling

  covers
    -  CP-794 Desktop/Mobile - EX - Step 4 - Security Answers and validations
  Validation Criteria
    - Is a required field.
    - Min length of 1 characters and Max length of 35 characters
    - Street address may not contain


  Background: user on Step 4 acquisition flow screen
    Given I am a user on the ex flow
    Given I am on the ex step4 verify page


  Scenario: 1 - User enters Security Answer
    When I have enter valid "s-answer" value "my dog ben"
    Then I shall be displayed no error for the "s-answer" field
    And "s-answer" field does not display warning Icon
    And "s-answer" field displays check Icon
    And "s-answer" input field shall be outlined in green

  Scenario: 2 - System restricts the user from entering more than 100 characters.
    When I have enter valid "s-answer" value "123456789012345678901234567890 dog ben"
    And I shall be displayed no error for the "s-answer" field
    Then I enter additional text into "s-answer" field text " 7890123"
    Then I am restricted from entering more than "35" characters in "s-answer" field

  # Validation scenarios for Street Address input field - When user does not enter any characters in the field.

  Scenario: 3 - User without entering Security Answer focuses out of Street Address field.
    When without entering "s-answer"
    Then "s-answer" field displays warning Icon
    And "s-answer" input field shall be outlined in red
    Then I shall be displayed an error for the "s-answer" field - "Please enter an answer for your selected question" in red

  Scenario: 3b - User focuses on the Street Address input field that has the error "Please enter an answer for your selected question"
    When without entering "s-answer"
    Then I shall be displayed an error for the "s-answer" field - "Please enter an answer for your selected question" in red
    And "s-answer" input field shall be black
    Then I enter additional text into "s-answer" field text "22 Cortland st"
    Then "s-answer" field does not display warning Icon
    And "s-answer" field displays check Icon
    And "s-answer" input field shall be outlined in green
    And I shall be displayed no error for the "s-answer" field
    Then I enter additional text into "s-answer" field text " %^&"
    Then "s-answer" field displays warning Icon
    And "s-answer" input field shall be outlined in red
    Then I shall be displayed an error for the "s-answer" field - "Your reminder answer may not contain the following characters" in red

  # extended validations
  Scenario: 1 - User enters valid Security Answer
    When I have enter valid "s-answer" value I do not see the validation error message
      | street_entered           |
      | My dog has feas          |
      | Spetember 1943           |
      | d'amore                  |
      | When I was 10 years old. |
      | 42nd st.                 |

  Scenario: 4b - User focuses on the Security Answer input field that has the error
    When I have enter invalid "s-answer" value "22 Cortl%nd streeet" that "has an '% symbol"
    And I shall be displayed an error for the "s-answer" field - "Your reminder answer may not contain the following characters: " in red
    When I have enter valid "s-answer" value "22 Cortland st"
    And I shall be displayed no error for the "s-answer" field

  Scenario: User enters invalid characters in Security Answer multiple input errors
    When I have enter invalid characters "![]&@%?<>!$():;~^{}+=|*ãü木✉" into valid input "road" on the "s-answer" and I see validation error message "Your reminder answer may not contain the following characters:"

  Scenario: User enters additional invalid characters in Security Answer multiple input errors
  # yea escaping this tests quote " and \
    When I have enter invalid characters "\\\"" into valid input "road" on the "s-answer" and I see validation error message "Your reminder answer may not contain the following characters:"
