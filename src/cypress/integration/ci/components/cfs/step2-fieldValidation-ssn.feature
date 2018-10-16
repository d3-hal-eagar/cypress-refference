Feature: cfs/step2-fieldValidation-ssn4.feature

  Covers:
    - CP-492 Desktop/Mobile - CFS - Step 2 Page - ssn4 Input Fields

  Validation Rules:
  - Required field.
  - Numbers only.
  - Maximum of 4 numbers.
  - Minimum of 4 numbers.

  Background: user on Step 2 acquisition flow in Experian
    Given I am a user on the cfs flow
    Given I am on the cfs step2 page

  Scenario: 1 - Default view of the ssn field
    And The "ssn" field label is "Social Security Number:"
    Then The ".lock-icon" element present on the desktop page only

  Scenario: 2 ssn Field Border Glow
    When I click on the "ssn1" field
    When I focus on the "ssn1" field
    And The "ssn1" field border shall have a highlighted focus border
    When I click on the "ssn2" field
    When I focus on the "ssn2" field
    And The "ssn2" field border shall have a highlighted focus border
    When I click on the "ssn4" field
    When I focus on the "ssn4" field
    And The "ssn4" field border shall have a highlighted focus border

  Scenario: 3 - the system shall mask the ssn digits behind bullets for the ssn1 and ssn2 after they are valid
    Then "ssn1" field does not have masked characters
    And I have enter valid "ssn1" value "132"
    Then "ssn1" field has masked characters
    Then "ssn2" field does not have masked characters
    And I have enter valid "ssn2" value "63"
    Then "ssn2" field has masked characters
    And I have enter valid "ssn4" value "1234"
    Then "ssn4" field does not have masked characters
    And I click element "cta-button"
    Then "ssn1" field does not have masked characters
    Then "ssn2" field does not have masked characters

  Scenario: 4 - User enters valid ssn
    And I have enter valid "ssn1" value "284"
    And I have enter valid "ssn2" value "44"
    And I have enter valid "ssn4" value "9756"
    And I click element "cta-button"
    Then I shall be displayed no error for the "ssn4" field

  Scenario: 5 - all ssn fields required
    When without entering "ssn1"
    And I have enter valid "ssn2" value "64"
    And I have enter valid "ssn4" value "9756"
    And I click element "cta-button"
    #CP-327 #And I shall be displayed an error for the "ssn4" field - "Invalid SSN" in red
    And I shall be displayed an error for the "ssn4" field - "Please enter valid SSN." in red
    And The "ssn1" field border is outlined in red color

  Scenario: 4 - focus shall auto advance between ssn fields as valid data is entered
    And I have enter valid "ssn1" value "284"
    Then Check that the "ssn2" field is focused
    And I have enter valid "ssn2" value "44"
    Then Check that the "ssn4" field is focused
    And I have enter valid "ssn4" value "9756"

    Given I am on the cfs step2 page
    And I have enter valid "ssn1" value "258"
    And I have enter valid "ssn2" value "s"
    And I have enter valid "ssn4" value "9756"
    And I click element "cta-button"
    #CP-327 #And I shall be displayed an error for the "ssn4" field - "Invalid SSN" in red
    And I shall be displayed an error for the "ssn4" field - "Please enter valid SSN." in red
    And The "ssn2" field border is outlined in red color

    Given I am on the cfs step2 page
    And I have enter valid "ssn1" value "298"
    And I have enter valid "ssn2" value "47"
    And I have enter valid "ssn4" value "s"
    And I click element "cta-button"
    #CP-327 #And I shall be displayed an error for the "ssn4" field - "Invalid SSN" in red
    And I shall be displayed an error for the "ssn4" field - "Please enter valid SSN." in red
    And The "ssn4" field border is outlined in red color

  Scenario: 6 - System restricts the user from entering more digits than expected for ssn
    And I have enter invalid "ssn1" value "1234567890" that "has more than 3 digits"
    Then I am restricted from entering more than "3" characters in "ssn1" field
    And I have enter invalid "ssn2" value "1234567890" that "has more than 2 digits"
    Then I am restricted from entering more than "2" characters in "ssn2" field
    And I have enter invalid "ssn4" value "1234567890" that "has more than 4 digits"
    Then I am restricted from entering more than "4" characters in "ssn4" field

  Scenario: 7 - User enters symbol other than digits on ssn Input fields
    And I have enter invalid "ssn1" value "41e" that "has symbol other than digits"
    And I click element "cta-button"
    #CP-327 #And I shall be displayed an error for the "ssn4" field - "Invalid SSN" in red
    Then I shall be displayed an error for the "ssn1" field - "Please enter valid SSN." in red
    And The "ssn1" field border is outlined in red color

    Given I am on the cfs step2 page
    And I have enter invalid "ssn2" value "4u" that "has symbol other than digits"
    And I click element "cta-button"
    #CP-327 #And I shall be displayed an error for the "ssn4" field - "Invalid SSN" in red
    Then I shall be displayed an error for the "ssn2" field - "Please enter valid SSN." in red
    And The "ssn2" field border is outlined in red color

    Given I am on the cfs step2 page
    And I have enter invalid "ssn4" value "8o68" that "has symbol other than digits"
    And I click element "cta-button"
    #CP-327 #And I shall be displayed an error for the "ssn4" field - "Invalid SSN" in red
    Then I shall be displayed an error for the "ssn4" field - "Please enter valid SSN." in red
    And The "ssn4" field border is outlined in red color

  Scenario: 8 - User enters less than expected digits on ssn Input fields
    And I have enter invalid "ssn1" value "62" that "has less then 3 digits"
    And I click element "cta-button"
    #CP-327 #And I shall be displayed an error for the "ssn4" field - "Invalid SSN" in red
    Then I shall be displayed an error for the "ssn1" field - "Please enter valid SSN." in red
    And The "ssn1" field border is outlined in red color

    Given I am on the cfs step2 page
    And I have enter invalid "ssn2" value "3" that "has less then 2 digits"
    And I click element "cta-button"
    #CP-327 #And I shall be displayed an error for the "ssn4" field - "Invalid SSN" in red
    Then I shall be displayed an error for the "ssn2" field - "Please enter valid SSN." in red
    And The "ssn2" field border is outlined in red color

    Given I am on the cfs step2 page
    And I have enter invalid "ssn4" value "123" that "has less then 4 digits"
    And I click element "cta-button"
    #CP-327 #And I shall be displayed an error for the "ssn4" field - "Invalid SSN" in red
    Then I shall be displayed an error for the "ssn4" field - "Please enter valid SSN." in red
    And The "ssn4" field border is outlined in red color

  Scenario: 9 - User focuses back on ssn4 Input field that has the error message and fixes it
    And I have enter invalid "ssn4" value "12o3" that "contains a letter"
    And I click element "cta-button"
    #CP-327 #And I shall be displayed an error for the "ssn4" field - "Invalid SSN" in red
    Then I shall be displayed an error for the "ssn4" field - "Please enter valid SSN." in red
    When I have enter valid "ssn4" value "7865"
    And I click element "cta-button"
    Then I shall be displayed no error for the "ssn4" field

    Given I am on the cfs step2 page
    And I have enter invalid "ssn1" value "14o" that "contains a letter"
    And I click element "cta-button"
    #CP-327 #And I shall be displayed an error for the "ssn4" field - "Invalid SSN" in red
    Then I shall be displayed an error for the "ssn4" field - "Please enter valid SSN." in red
    When I have enter valid "ssn1" value "763"
    And I click element "cta-button"
    Then I shall be displayed no error for the "ssn1" field

    Given I am on the cfs step2 page
    And I have enter invalid "ssn2" value "o3" that "contains a letter"
    And I click element "cta-button"
    #CP-327 #And I shall be displayed an error for the "ssn4" field - "Invalid SSN" in red
    Then I shall be displayed an error for the "ssn4" field - "Please enter valid SSN." in red
    When I have enter valid "ssn2" value "75"
    And I click element "cta-button"
    Then I shall be displayed no error for the "ssn2" field

  Scenario: User enters invalid characters in ssn4 code multiple input errors
    When I have enter invalid characters "![]&@%?<>!$():;~^{}+=|*ãü木✉" into valid input "1234" on the "ssn4" and I see validation error message "Please enter valid SSN."

  Scenario: User enters additional invalid characters in ssn4 code multiple input errors
    When I have enter invalid characters "' .,#_\/\\\"" into valid input "1234" on the "ssn4" and I see validation error message "Please enter valid SSN."

#
#  Scenario: User enters invalid characters in ssn1 code multiple input errors
#    When I have enter invalid characters "![]&@%?<>!$():;~^{}+=|*ãü木✉" into valid input "132" on the "ssn1" and I see validation error message "Please enter valid SSN."
#
#  Scenario: User enters additional invalid characters in ssn1 code multiple input errors
#    When I have enter invalid characters "' .,#_\/\\\"" into valid input "143" on the "ssn1" and I see validation error message "Please enter valid SSN."
#
#
#  Scenario: User enters invalid characters in ssn2 code multiple input errors
#    When I have enter invalid characters "![]&@%?<>!$():;~^{}+=|*ãü木✉" into valid input "13" on the "ssn2" and I see validation error message "Please enter valid SSN."
#
#  Scenario: User enters additional invalid characters in ssn2 code multiple input errors
#    When I have enter invalid characters "' .,#_\/\\\"" into valid input "18" on the "ssn2" and I see validation error message "Please enter valid SSN."
