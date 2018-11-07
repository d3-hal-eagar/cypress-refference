Feature: cfs/step3-fieldValidation-cardNumber.feature

  Covers:
  CP-2264 Desktop - CFS - Step 3 CC Page - Credit Card Information Section
  CP-2286 Mobile - CFS - Step 3 CC Page - Credit Card Information Section

  Background: user on Step 3CC acquisition flow screen
    Given I am a user on the cfs flow
    Given Register "Donald Blair"
    Given Mock KBA
    Given I am on the cfs step3A authentication page
    Then Wait for not exists ".loading-modal"
    Given Mock KBA pass
    Given Mock scores-quick "812"
    When I fill out kba questions and submit
    Then Action detail "I have reached Step 3CC"


  Scenario: 2 Card Number Field Border Glow
    When I click on the "ccNum" field
    Then I enter additional text into "ccNum" field text "6"
    And The "ccNum" field border shall have a highlighted focus border

  Scenario: 3 - User enters valid Card Number
    When I have enter valid "ccNum" value "4111111111111111"
    And I click element "cta-button"
    Then I shall be displayed no error for the "ccNum" field

  Scenario: 4 - Card Number fields required
    When without entering "ccNum"
    And I have enter valid "ccCvv" value "123"
    And I select "05" on the "ccExpMonth" field
    And I select "2022" on the "ccExpYear" field
    And I click element "cta-button"
    And I shall be displayed an error for the "ccNum" field - "Credit Card - Number cannot be blank." in red
    And The "ccNum" field border is outlined in red color

  Scenario: 5 - System restricts the user from entering more digits than expected for Card Number
    When I have enter invalid "ccNum" value "411111111111111123456" that "has more than 16 digits"
    Then I am restricted from entering more than "16" characters in "ccNum" field

  Scenario: 6 - User enters symbol other than digits on Card Number input field
    When I have enter invalid "ccNum" value "4111111111111we1" that "has symbol other than digits"
    And I click element "cta-button"
    And I shall be displayed an error for the "ccNum" field - "Credit Card - Number is invalid" in red
    And The "ccNum" field border is outlined in red color
    Then I shall be able to enter only numbers into the "ccNum" field

  Scenario: 7 - User enters less than expected digits on Card Number input field
    And I have enter invalid "ccNum" value "41111111111" that "has less then 15 digits"
    And I click element "cta-button"
    Then I shall be displayed an error for the "ccNum" field - "Credit Card - Number is invalid" in red
    And The "ccNum" field border is outlined in red color

  Scenario: 8 - User focuses back on Card Number input field that has the error message and fixes it
    And I have enter invalid "ccNum" value "1234567890123pp" that "has less then 15 digits"
    And I click element "cta-button"
    Then I shall be displayed an error for the "ccNum" field - "Credit Card - Number is invalid" in red
    When I have enter valid "ccNum" value "4111111111111111"
    And I click element "cta-button"
    Then I shall be displayed no error for the "ccNum" field

  Scenario: User enters invalid characters in Card Number code multiple input errors
    When I have enter invalid characters "![]&@%?<>!$():;~^{}+=|*ãü木✉" into valid input "411111111111115" on the "ccNum" and I see validation error message "Credit Card - Number is invalid"

  Scenario: User enters additional invalid characters in Card Number code multiple input errors
    When I have enter invalid characters "' .,#_\/\\\"" into valid input "411111111111115" on the "ccNum" and I see validation error message "Credit Card - Number is invalid"
