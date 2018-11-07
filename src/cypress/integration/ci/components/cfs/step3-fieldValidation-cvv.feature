Feature: cfs/step3-fieldValidation-cvv.feature

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


  Scenario: 2 cvv Field Border Glow
    When I click on the "ccCvv" field
    Then I enter additional text into "ccCvv" field text "6"
    And The "ccCvv" field border shall have a highlighted focus border

  Scenario: 4 - User enters valid cvv
    When I have enter valid "ccCvv" value "123"
    And I click element "cta-button"
    Then I shall be displayed no error for the "ccCvv" field
    When I have enter valid "ccCvv" value "1234"
    And I click element "cta-button"
    Then I shall be displayed no error for the "ccCvv" field

  Scenario: 5 - cvv fields required
    When without entering "ccCvv"
    And I have enter valid "ccNum" value "4111111111111111"
    And I select "05" on the "ccExpMonth" field
    And I select "2022" on the "ccExpYear" field
    And I click element "cta-button"
    And I shall be displayed an error for the "ccCvv" field - "Credit Card - CVV is invalid" in red
    And The "ccCvv" field border is outlined in red color

  Scenario: 6 - System restricts the user from entering more digits than expected for cvv
    When I have enter invalid "ccCvv" value "1234567890" that "has more than 4 digits"
    Then I am restricted from entering more than "4" characters in "ccCvv" field

  Scenario: 7 - User enters symbol other than digits on cvv input field
    When I have enter invalid "ccCvv" value "41e" that "has symbol other than digits"
    And I click element "cta-button"
    And I shall be displayed an error for the "ccCvv" field - "Credit Card - CVV is invalid" in red
    And The "ccCvv" field border is outlined in red color
    Then I shall be able to enter only numbers into the "ccCvv" field

  Scenario: 8 - User enters less than expected digits on cvv input field and focuses back on cvv input field and fixes it
    And I have enter invalid "ccCvv" value "12" that "has less then 3 digits"
    And I click element "cta-button"
    Then I shall be displayed an error for the "ccCvv" field - "Credit Card - CVV is invalid" in red
    When I have enter valid "ccCvv" value "7865"
    And I click element "cta-button"
    Then I shall be displayed no error for the "ccCvv" field

  Scenario: User enters invalid characters in cvv code multiple input errors
    When I have enter invalid characters "![]&@%?<>!$():;~^{}+=|*ãü木✉" into valid input "123" on the "ccCvv" and I see validation error message "Credit Card - CVV is invalid"

  Scenario: User enters additional invalid characters in cvv code multiple input errors
    When I have enter invalid characters "' .,#_\/\\\"" into valid input "123" on the "ccCvv" and I see validation error message "Credit Card - CVV is invalid"
