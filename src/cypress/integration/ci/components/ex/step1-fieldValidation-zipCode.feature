Feature: ex/step1-fieldValidation-zipCode.feature

  Covers
    - CP-841 Desktop - EX - Step 1 Page - Zip Code - Validation Criteria & Error Handling
  Validation Criteria
    - Is a required field.
  - must be exactly 5 digits long.
  - must only contain numbers

  Note the message "Please use numbers only in this field." is never expected due to implementation
  where non numbers are not allowed in the field


  Background: user on Step 1 acquisition flow screen
    Given I am a user on the ex flow
    Given I am on the ex step1 signup page


  Scenario: 1 - User enters valid Zip Code
    When I have enter valid "zip" value "10007"
    Then The "zip" field border is displayed in green
    And A green checkmark inside the "zip" field is displayed
    Then I shall be displayed no error for the "zip" field

  Scenario: 2 - System restricts the user to enter a maximum of five characters
    When I have enter valid "zip" value "12345"
    Then I shall be displayed no error for the "zip" field
    And I enter additional text into "zip" field text "678"
    And I am restricted from entering more than "5" characters in "zip" field

  Scenario: 3 - User enters less than 5 digits on Zip Code input field
    When I have enter invalid "zip" value "100" that "has less than 5 digits"
    Then I shall be displayed an error for the "zip" field - "Please enter a valid zip code." in red
    And The "zip" field border is outlined in red color
    And A red warning icon inside the "zip" field is displayed

  Scenario: 3a - User focuses back on the Zip-Code field that has the error "Please enter a valid zip code."
    When I have enter invalid "zip" value "123" that "has less than 5 digits"
    Then I shall be displayed an error for the "zip" field - "Please enter a valid zip code." in red
    When I have enter valid "zip" value "10007"
    #Then "zip" field label is displayed in black
    And "zip" field input is displayed in black
    And I shall be displayed no error for the "zip" field

  Scenario: 4 - User enters alphabets/special characters
    When I have enter invalid "zip" value I see the correct validation error message
      | zip_entered | type_of_err                    | err_message                    |
      | 123O5       | has a 'O' letter               | Please enter a valid zip code. |
      | 12'35       | has a ''' symbol               | Please enter a valid zip code. |
      | 22,12       | has a ',' symbol               | Please enter a valid zip code. |
      | 22z12       | has a 'z' letter               | Please enter a valid zip code. |
      | 22#12       | has a '#' symbol               | Please enter a valid zip code. |
      | 22.12       | has a '.' symbol               | Please enter a valid zip code. |
      | 1\\123      | has a '\\' symbol              | Please enter a valid zip code. |
      | 22"00       | has a '"' symbol               | Please enter a valid zip code. |
      | 22–09       | has a non-ASCII en dash symbol | Please enter a valid zip code. |
      | 22—21       | has a non-ASCII em dash symbol | Please enter a valid zip code. |

  Scenario: 4a - User focuses back on the Zip-Code field that has the error "Please use numbers only in this field"
      And I have enter invalid "zip" value "100%2" that "has an '%' symbol"
    Then I shall be displayed an error for the "zip" field - "Please enter a valid zip code." in red
    Then "zip" field is "4" characters in length
    When I have enter valid "zip" value "31023"
    #Then "zip" field label is displayed in black
    And "zip" field input is displayed in black
    And I shall be displayed no error for the "zip" field

    # Validation scenarios for Zip Code - When user does not enter any characters.

  Scenario: 5 - User does not enter a Zip Code
    When without entering "zip"
    Then I shall be displayed an error for the "zip" field - "Please enter a valid zip code." in red

  Scenario: 5a - User focuses back on the Zip code field that has the error - "Please enter a valid zip code."
    When without entering "zip"
    Then I shall be displayed an error for the "zip" field - "Please enter a valid zip code." in red
    When I have enter valid "zip" value "99999"
    #Then "zip" field label is displayed in black
    And "zip" field input is displayed in black
    And I shall be displayed no error for the "zip" field

  Scenario: User enters invalid characters in Zip code multiple input errors
    When I have enter invalid characters "![]&@%?<>!$():;~^{}+=|*ãü木✉" into valid input "12345" on the "zip" and I see validation error message "Please enter a valid zip code."

  Scenario: User enters additional invalid characters in Zip code multiple input errors
    When I have enter invalid characters "' .,#_\/\\\"" into valid input "12345" on the "zip" and I see validation error message "Please enter a valid zip code."
