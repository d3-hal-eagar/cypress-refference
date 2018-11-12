Feature: cfs/step1-fieldValidation-phoneNumber.feature

  Covers
    - CP-2475 Desktop/Mobile - CFS - Step 1 Page - Phone Number Field
  Validation Criteria
    - Is Non-required field.
  - must be exactly 10 digits long.
  - must only contain numbers


  Background: user on Step 1 acquisition flow screen
    Given I am a user on the cfs flow
    Given I am on the cfs step1 page


  Scenario: 1 - User enters valid Phone Number
    When I have enter valid "phone1" value "555"
    When I have enter valid "phone2" value "987"
    When I have enter valid "phone3" value "6234"
    And I click element "cta-button"
    Then I shall be displayed no error for the "phone1" field

  Scenario: 2 As a user when I enter information to the Phone Number Fields, the system shift focus from one field to the next of the  Phone Number Fields.
    # this will test the auto advance focus
    When I have enter valid "phone1" value "5559876234"
    And I click element "cta-button"
    Then I shall be displayed no error for the "phone1" field

  Scenario: 2 - System restricts the user to enter a maximum of ten characters
    When I have enter valid "phone1" value "5559876234"
    Then I shall be displayed no error for the "phone1" field
    And I enter additional text into "phone3" field text "999"
    And I am restricted from entering more than "3" characters in "phone1" field
    And I am restricted from entering more than "3" characters in "phone2" field
    And I am restricted from entering more than "4" characters in "phone3" field

  Scenario: 3 - User enters less than 3,3,4 digits on Phone input fields
    When I have enter invalid "phone1" value "21" that "has less than 3 digits"
    When I have enter valid "phone2" value "987"
    When I have enter valid "phone3" value "6234"
    And I click element "cta-button"
    And The "phone1" field border is outlined in red color
    And The "phone2" field border is outlined in red color
    And The "phone3" field border is outlined in red color
    Then I shall be displayed an error for the "phone1" field - "Please enter a valid phone number." in red

    When I have enter valid "phone1" value "321"
    When I have enter invalid "phone2" value "87" that "has less than 3 digits"
    When I have enter valid "phone3" value "6234"
    And The "phone1" field border is outlined in red color
    And The "phone2" field border is outlined in red color
    And The "phone3" field border is outlined in red color
    Then I shall be displayed an error for the "phone2" field - "Please enter a valid phone number." in red

    When I have enter valid "phone1" value "321"
    When I have enter valid "phone2" value "987"
    When I have enter invalid "phone3" value "234" that "has less than 4 digits"
    And The "phone1" field border is outlined in red color
    And The "phone2" field border is outlined in red color
    And The "phone3" field border is outlined in red color
    Then I shall be displayed an error for the "phone3" field - "Please enter a valid phone number." in red

  Scenario: 3a - User focuses back on the Phone field that has the error and fixed it
    When I have enter invalid "phone3" value "234" that "has less than 4 digits"
    And I click element "cta-button"
    Then I shall be displayed an error for the "phone3" field - "Please enter a valid phone number." in red
    And The "phone1" field border is outlined in red color
    And The "phone2" field border is outlined in red color
    And The "phone3" field border is outlined in red color

    When I have enter valid "phone1" value "555"
    When I have enter valid "phone2" value "987"
    When I have enter valid "phone3" value "6234"
    And I shall be displayed no error for the "phone3" field

  Scenario: 4 - User enters alphabets/special characters
    When I have enter invalid "phone1" value I see the correct validation error message
      | phone_entered    | type_of_err               | err_message                        |
      | 523O567891       | has a 'O' letter          | Please enter a valid phone number. |
      | 523 567891       | has a ' ' symbol          | Please enter a valid phone number. |
      | 523-567891       | has a '-' symbol          | Please enter a valid phone number. |
      | 523z567891       | has a 'z' letter          | Please enter a valid phone number. |

  Scenario: 5 - User does not enter a Phone Number
    When without entering "phone1"
    And I click element "cta-button"
    Then I shall be displayed no error for the "phone1" field

  Scenario: User enters invalid characters in Phone multiple input errors
    When I have enter invalid characters "![]&@%?<>!$():;~^{}+=|*ãü木✉" into valid input "5553334444" on the "Phone1" and I see validation error message "Please enter a valid phone number."

  Scenario: User enters additional invalid characters in Phone multiple input errors
    When I have enter invalid characters "' .,#_\/\\\"" into valid input "5553334444" on the "Phone1" and I see validation error message "Please enter a valid phone number."
