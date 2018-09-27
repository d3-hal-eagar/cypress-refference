Feature: ex/step4-fieldValidation-securityAnswer.feature

  covers
    -  CP-794 Desktop/Mobile - EX - Step 4 - Security Answers and validations
  Validation Criteria
    - Is a required field.
    - Min length of 1 characters and Max length of 35 characters
    - Street address may not contain


  Background: user on Step 4 acquisition flow screen
    Given I am a user on the ex flow
    Given I am on the ex step4 verify page


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
