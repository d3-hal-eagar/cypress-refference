Feature: Step 1 Create your account fields password

  As a user I create an account by providing valid email and password
  Covers
    - D3F-30 Create Password - Field Validations and Error Handling
    - D3F-355 Mobile - Create Password - Field Validations and Error Handling
    - D3F-33 Show/Hide Password Feature
    - D3F-32 Password Masking Feature


  Background:
    Given I am a user on the ck flow
    Given I am on the ck step1 signup page


  #D3F-30
  Scenario: 1 User enters a password that meets the required password criteria
    When I have enter valid "password" value "asdf1234$RFV"
    Then I shall be displayed no error for the "password" field

  Scenario: 2 User without entering a Password focuses out of the field
    When without entering "password"
    Then I shall be displayed an error for the "password" field - "Please create your password."
    And "password" field label is displayed in red
    And "password" field displays X Icon

  Scenario: 2a User without entering a Password focuses out of the field, then returns to enter text
    When without entering "password"
    And I click the label on the "password" field
    #And I click the X Icon on the "password" field
    Then "password" field does not display X Icon
    And Check that the "password" field is focused
    #Then I am displayed a "password" tooltip - "This should be at least 8 characters. Try to pick something that's not easy to guess." on desktop only
    And "password" field label is displayed in red
    When I enter additional text into "password" field text "x"
    #cursor changes to black (not tested)
    Then I shall be displayed no error for the "password" field

  Scenario: 2b - When the user focuses back on the Create Password field that has an error
    When without entering "password"
    Then "password" field does not display X Icon
    #Then I am displayed a "password" tooltip - "This should be at least 8 characters. Try to pick something that's not easy to guess." on desktop only
    And I enter additional text into "password" field text "J"
    And I shall be displayed no error for the "password" field

  Scenario: 3 User enters a password that does not meet the required minimum character length
    When I have enter invalid "password" value "asdf1" that "does not meet the required minimum character length"
   Then I shall be displayed an error for the "password" field - "Password must be 8 characters or longer, and contain at least one of each: uppercase letters, lowercase letters, numbers, and symbols !@#$%^&*<>?_"
    And "password" field label is displayed in red
    And "password" field displays X Icon

  Scenario: 3a User enters a password that does not meet the required minimum character length then types more
    When I have enter invalid "password" value "asdf1" that "does not meet the required minimum character length"
    Then I shall be displayed an error for the "password" field - "Password must be 8 characters or longer, and contain at least one of each: uppercase letters, lowercase letters, numbers, and symbols !@#$%^&*<>?_"
    When I click on the "email" field
    And I click the label on the "password" field
    #And I click the X Icon on the "password" field
    Then "password" field does not display X Icon
    And Check that the "password" field is focused
    #Then I am displayed a "password" tooltip - "This should be at least 8 characters. Try to pick something that's not easy to guess." on desktop only
    And "password" field label is displayed in red
    When I enter additional text into "password" field text "t"
    Then I shall be displayed no error for the "password" field

  Scenario: 3b User enters a password that does not meet the required minimum character length, then backspaces
    When I have enter invalid "password" value "asdf123" that "does not meet the required minimum character length"
    Then I shall be displayed an error for the "password" field - "Password must be 8 characters or longer, and contain at least one of each: uppercase letters, lowercase letters, numbers, and symbols !@#$%^&*<>?_"

    When I enter additional text into "password" field text "{backspace}"
    And I shall be displayed no error for the "password" field

  Scenario: 4 User enters a password that is easy to guess
    Given I have enter invalid "password" value "12345678" that "is easy to guess"
    Then I shall be displayed an error for the "password" field - "Password must be 8 characters or longer, and contain at least one of each: uppercase letters, lowercase letters, numbers, and symbols !@#$%^&*<>?_"
    And "password" field label is displayed in red
    And "password" field displays X Icon

# identified as a distinct case not covered in D3F-30 but rejected for inclusion in our app
#  Scenario: 5 User enters email as password.
#    Given I have enter valid "email" value "testomatic@credmo.com"
#    When I have enter invalid "password" value "testomatic@credmo.com" that "contains part of the email"
#    Then I shall be displayed an error for the "password" field - "Please do not use your email as your password."
#    And "password" field label is displayed in red
#    And "password" field displays X Icon
#    #And the characters entered are red in color.

  Scenario: 5a User enters their name from their email as password.
    Given I have enter valid "email" value "testomatic@credmo.com"
    When I have enter invalid "password" value "testomatic" that "contains part of the email"
    Then I shall be displayed an error for the "password" field - "Password must not include email."
    And "password" field label is displayed in red
    And "password" field displays X Icon

  Scenario: 5b User enters the domain from their email as password.
    Given I have enter valid "email" value "testomatic@magicred.com"
    When I have enter invalid "password" value "magicred" that "contains part of the email"
    Then I shall be displayed an error for the "password" field - "Password must not include email."
    And "password" field label is displayed in red
    And "password" field displays X Icon

  Scenario Outline: User enters a valid password
    When I have enter valid "password" value "<userPassword>"
    And I shall be displayed no error for the "password" field

    Examples:
      | userPassword                   |
      | theWind1n*                     |
      | The_will0ws                    |
      | 1$ecurePassword                |
      | 2$ecürePassword                |
      | 3$ecurePass✉                   |
      | 4$ecure木assworD                |
      | 1Secure?\"                      |
      | 1Secure&'#,.                    |
      | 1Secure![]&@%?<>!$():;~^{}+=_* |
      | 1!ecurePassword                |
      | 1#ecurePassword                |
      | 1$ecurePassword                |
      | 1%ecurePassword                |
      | 1^ecurePassword                |
      | 1?ecurePassword                |
      | 1 ecurePassword                |
      | 1<ecurePassword                |
      | 1>ecurePassword                |

  Scenario Outline: User enters invalid password.
    Given
    Given I have enter valid "email" value "jimmy.smith@email.myownpoB0x.com"
    When I select the Show button
    When I have enter invalid "password" value "<userPassword>" that "<type_of_error>"
    Then I shall be displayed an error for the "password" field - "<error_message>"

    Examples:
      | userPassword        | type_of_error              | error_message                                                                     |
      | jimmy.smith         | contains part of the email | Password must not include email.                                                  |
      | jimmy.smith123      | contains part of the email | Password must not include email.                                                  |
      | email.myownpoB0x    | contains part of the email | Password must not include email.                                                  |
      | email.myownpoB0x123 | contains part of the email | Password must not include email.                                                  |
      | @#$ $               | too short                  | Password must be 8 characters or longer, and contain at least one of each: uppercase letters, lowercase letters, numbers, and symbols !@#$%^&*<>?_                                          |
      | secure              | too short                  | Password must be 8 characters or longer, and contain at least one of each: uppercase letters, lowercase letters, numbers, and symbols !@#$%^&*<>?_                                          |
      | $EvEn7              | too short                  | Password must be 8 characters or longer, and contain at least one of each: uppercase letters, lowercase letters, numbers, and symbols !@#$%^&*<>?_                                          |
      | password            | easy to guess              | Password must be 8 characters or longer, and contain at least one of each: uppercase letters, lowercase letters, numbers, and symbols !@#$%^&*<>?_ |
      | 88888888            | easy to guess              | Password must be 8 characters or longer, and contain at least one of each: uppercase letters, lowercase letters, numbers, and symbols !@#$%^&*<>?_ |
      #| smith               | contains part of the email | Password must not include email.                                                  |
      #| myownpoB0x          | contains part of the email | Password must not include email.                                                  |

  #D3F-32
  Scenario: system shall by default mask the password characters behind bullets, with an option to show the full text
    When I enter additional text into "password" field text "LoveG0d!"
    Then "password" field has masked characters

    When I select the Show button
    Then "password" field displays as plain text
    #And change the Show button to Hide button

    And I select the Hide button
    Then "password" field has masked characters
    #And change the Hide button to Show button
    When I select the Show button

