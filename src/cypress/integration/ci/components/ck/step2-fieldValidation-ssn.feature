Feature: Social Security Number - Validation Criteria & Error Handling

  Covers:
  CP-769 - Social Security Number - Validation Criteria & Error Handling
  CP-788 - Mobile - Social Security Number - Validation Criteria & Error Handling

  Validation Rules:
  - Required field.
  - 3 input fields with 3, 2 and 4 digits in length

  Background: user on Step 2 acquisition flow screen
    Given I am a user on the ck flow
    When I am on the ck step2 form page


  Scenario: 1 - Default view of the SSN field
    Then I shall be displayed the "ssn1", "ssn2" and "ssn" fields in the XXX-XX-___ format

  Scenario: 2 - As a user when I enter four digits in the SSN Last password field, the system shall mask the SSN digits as entered, behind bullets.
    And I have enter valid "ssn" value "1234"
    Then "ssn" field has masked characters

  Scenario: 3 - User enters last 4 digits of SSN
    And I have enter valid "ssn" value "1234"
    And I focus on the "street2" field
    Then I shall be displayed no error for the "ssn" field

  Scenario: 4 - System restricts the user from entering more than 4 digits in the 'last 4 digits of SSN' field.
    And I focus on the "ssn" field
    When I have enter invalid "ssn" value "1234567890" that "has more than 4 digits"
    Then I am restricted from entering more than "4" characters in "ssn" field

  Scenario: 5 - User enters no digits on SSN Input field.
    And I focus on the "ssn" field
    And I have enter invalid "ssn" value I see the correct validation error message
      | snn_entered | type_of_err                    | err_message                                        |
      | 22z1        | has a 'z' letter               | Your entry must be a number consisting of 4 digits |
      | 12'0        | has a ''' symbol               | Your entry must be a number consisting of 4 digits |
      | 22,1        | has a ',' symbol               | Your entry must be a number consisting of 4 digits |
      | 2fdw        | has a letters                  | Your entry must be a number consisting of 4 digits |
      | 22#1        | has a '#' symbol               | Your entry must be a number consisting of 4 digits |
      | 22.1        | has a '.' symbol               | Your entry must be a number consisting of 4 digits |
      | 22!0        | has a '!' symbol               | Your entry must be a number consisting of 4 digits |
      | 1\\12       | has a '\\' symbol              | Your entry must be a number consisting of 4 digits |
      | 22[0        | has a '[' symbol               | Your entry must be a number consisting of 4 digits |
      | 22]0        | has a ']' symbol               | Your entry must be a number consisting of 4 digits |
      | 22&0        | has a '&' symbol               | Your entry must be a number consisting of 4 digits |
      | 22@0        | has a '@' symbol               | Your entry must be a number consisting of 4 digits |
      | 22%0        | has a '%' symbol               | Your entry must be a number consisting of 4 digits |
      | 22&0        | has a '&' symbol               | Your entry must be a number consisting of 4 digits |
      | 22?0        | has a '?' symbol               | Your entry must be a number consisting of 4 digits |
      | 22>0        | has a '>' symbol               | Your entry must be a number consisting of 4 digits |
      | 22<0        | has a '<' symbol               | Your entry must be a number consisting of 4 digits |
      | 22"0        | has a '"' symbol               | Your entry must be a number consisting of 4 digits |
      | 22$0        | has a '$' symbol               | Your entry must be a number consisting of 4 digits |
      | 22)0        | has a ')' symbol               | Your entry must be a number consisting of 4 digits |
      | 22(0        | has a '(' symbol               | Your entry must be a number consisting of 4 digits |
      | 22:0        | has a ':' symbol               | Your entry must be a number consisting of 4 digits |
      | 22;0        | has a '~' symbol               | Your entry must be a number consisting of 4 digits |
      | 22^0        | has a '^' symbol               | Your entry must be a number consisting of 4 digits |
      | 22}0        | has a '}' symbol               | Your entry must be a number consisting of 4 digits |
      | 22{0        | has a '{' symbol               | Your entry must be a number consisting of 4 digits |
      | 22+0        | has a '+' symbol               | Your entry must be a number consisting of 4 digits |
      | 22_0        | has a '_' symbol               | Your entry must be a number consisting of 4 digits |
      | 22*0        | has a '*' symbol               | Your entry must be a number consisting of 4 digits |
      | 70ã9        | has a non-ASCII symbol         | Your entry must be a number consisting of 4 digits |
      | 23ü4        | has a non-ASCII symbol         | Your entry must be a number consisting of 4 digits |
      | 22–0        | has a non-ASCII en dash symbol | Your entry must be a number consisting of 4 digits |
      | 22—2        | has a non-ASCII em dash symbol | Your entry must be a number consisting of 4 digits |
      | 12六2        | has a unicode HAN symbol       | Your entry must be a number consisting of 4 digits |
      | 22✉0        | has a emoji symbol             | Your entry must be a number consisting of 4 digits |

    And "ssn-label" field label is displayed in red
    And I shall be displayed an error for the "ssn-error-message" field - "Your entry must be a number consisting of 4 digits" in red font color

  Scenario: 5a - User enters symbol other than digits on SSN Input field.
    And I focus on the "ssn" field
    And I have enter invalid "ssn" value "123k" that "has symbol other than digits"
    And "ssn-label" field label is displayed in red
    And I shall be displayed an error for the "ssn-error-message" field - "Your entry must be a number consisting of 4 digits" in red font color

  Scenario: 5b - User enters less than 4 digits on SSN Input field.
    And I focus on the "ssn" field
    And I have enter invalid "ssn" value "123" that "has less then 4 digits"
    And I focus on the "street2" field
    And "ssn-label" field label is displayed in red
    And I shall be displayed an error for the "ssn-error-message" field - "Your entry must be a number consisting of 4 digits" in red font color

  Scenario: 5c - User focuses back on SSN Input field that has the error message -"Your entry must be a number consisting of 4 digits"
    And I focus on the "ssn" field
    And I have enter invalid "ssn" value "123" that "has less then 4 digits"
    And I focus on the "street2" field
    Then "ssn-label" field label is displayed in red
    And I shall be displayed an error for the "ssn-error-message" field - "Your entry must be a number consisting of 4 digits" in red font color
    When I focus on the "ssn" field
    And I have enter valid "ssn" value "7865"
    Then I shall be displayed no error for the "ssn" field
    And "ssn-label" field label is displayed in black
    And "ssn" input field shall be black
