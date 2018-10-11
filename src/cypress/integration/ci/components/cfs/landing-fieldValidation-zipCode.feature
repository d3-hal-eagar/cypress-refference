Feature: cfs/landing-fieldValidation-zipCode.feature

  Covers
    - CP-518 Desktop - CFS - Landing Page - Zip Code Field (API dependency)
  Validation Criteria
    - Is a required field.
  - must be exactly 5 digits long.
  - must only contain numbers

  Note the message "Please use numbers only in this field." is never expected due to implementation
  where non numbers are not allowed in the field


  Background: user on Step 1 acquisition flow screen
    Given I am a user on the cfs flow
    Given I am on the cfs landing page


  Scenario: 3 Zip Code Address Field Border Glow
    When I click on the "zip" field
    When I focus on the "zip" field
    And The "zip" field border shall have a highlighted focus border

  Scenario: 5 - User does not enter a Zip Code
    When without entering "zip"
    And The "zip" field border is outlined in red color

  Scenario: 5a- User does not enter a Zip Code
    And I click element "cta-button"
    And The "zip" field border is outlined in red color

  Scenario: 1 - User enters valid Zip Code
    When I have enter valid "zip" value "10007"
    Then I shall be displayed no error for the "zip" field
    Then The "zip" field border shall have a default border
    And I click element "cta-button"
    Then The "zip" field border shall have a default border

  Scenario: 2 - System restricts the user to enter a maximum of five characters
    When I have enter valid "zip" value "12345"
    Then I shall be displayed no error for the "zip" field
    Then The "zip" field border shall have a default border
    And I enter additional text into "zip" field text "678"
    And I am restricted from entering more than "5" characters in "zip" field

  Scenario: 3 - User enters less than 5 digits on Zip Code input field
    When I have enter invalid "zip" value "100" that "has less than 5 digits"
    And The "zip" field border is outlined in red color
    And I click element "cta-button"
    And The "zip" field border is outlined in red color

  Scenario: 3a - User focuses back on the Zip-Code field that has the error
    When I have enter invalid "zip" value "123" that "has less than 5 digits"
    #Then I shall be displayed an error for the "zip" field - "Please enter a valid zip code." in red
    And The "zip" field border is outlined in red color
    When I have enter valid "zip" value "10007"
    And I shall be displayed no error for the "zip" field
    Then The "zip" field border shall have a default border

  Scenario: 4a - User focuses back on the Zip-Code field that has the error
    And I have enter invalid "zip" value "100%2" that "has an '%' symbol"
    #Then I shall be displayed an error for the "zip" field - "Please enter a valid zip code." in red
    And The "zip" field border is outlined in red color
    Then "zip" field is "4" characters in length
    When I have enter valid "zip" value "31023"
    And I shall be displayed no error for the "zip" field
    Then The "zip" field border shall have a default border

  Scenario: 5a - User focuses back on the Zip code field that has the error
    When without entering "zip"
    #Then I shall be displayed an error for the "zip" field - "Please enter a valid zip code." in red
    And The "zip" field border is outlined in red color
    When I have enter valid "zip" value "99999"
    And I shall be displayed no error for the "zip" field
    Then The "zip" field border shall have a default border

  Scenario: User enters invalid characters in Zip code multiple input errors
    When I have enter invalid characters "![]&@%?<>!$():;~^{}+=|*ãü木✉" into valid input "12345" on the "zip" and I see validation error message "Please enter a valid zip code."

  Scenario: User enters additional invalid characters in Zip code multiple input errors
    When I have enter invalid characters "' .,#_\/\\\"" into valid input "12345" on the "zip" and I see validation error message "Please enter a valid zip code."
