Feature: cfs/step2-fieldValidation-password.feature

  As a user I create an account by providing valid email and password
  Covers
    - CP-507 Desktop/Mobile - CFS - Step 2 Page - Create Account

  Background:
    Given I am a user on the cfs flow
    Given I am on the cfs step2 page



  Scenario: password Field Border Glow
    When I click on the "password" field
    Then Check that the "password" field is focused
    And The "password" field border shall have a highlighted focus border

  #D3F-30
  Scenario: 1 User enters a password that meets the required password criteria
    When I have enter valid "password" value "asdf1234$RFV"
    And I click element "cta-button"
    Then I shall be displayed no error for the "password" field

  Scenario: 2 User without entering a Password returns to the field that has an error
    When without entering "password"
    And I click element "cta-button"
    #CP-327 #Then I shall be displayed an error for the "password" field - "Password cannot be blank" in red
    Then I shall be displayed an error for the "password" field - "Please create your password." in red
    And I enter additional text into "password" field text "J#j3J#j3"
    And I click element "cta-button"
    And I shall be displayed no error for the "password" field

  Scenario: 3 User enters a password that does not meet the required minimum character length
    When I have enter invalid "password" value "asdf1" that "does not meet the required minimum character length"
    And I click element "cta-button"
    #CP-327 #Then I shall be displayed an error for the "password" field - "Password for your account must be 6 or more characters long." in red
    Then I shall be displayed an error for the "password" field - "Password must be 8 characters or longer, and contain at least one of each: uppercase letters, lowercase letters, numbers, and symbols !@#$%^&*<>?_" in red

  Scenario: 4 User enters a password that is easy to guess
    Given I have enter invalid "password" value "12345678" that "is easy to guess"
    And I click element "cta-button"
    #CP-327 #Then I shall be displayed an error for the "password" field - "Password for your account must be 6 or more characters long." in red
    Then I shall be displayed an error for the "password" field - "Password must be 8 characters or longer, and contain at least one of each: uppercase letters, lowercase letters, numbers, and symbols !@#$%^&*<>?_" in red

  Scenario: 5a User enters their name from their email as password.
    Given I have enter valid "email" value "testomatic@credmo.com"
    When I have enter invalid "password" value "testomatic3D#" that "contains part of the email"
    And I click element "cta-button"
    #CP-327 #Then I shall be displayed an error for the "password" field - "Password for your account must be 6 or more characters long." in red
    Then I shall be displayed an error for the "password" field - "Password must not include e-mail." in red

  Scenario: 5b User enters the domain from their email as password.
    Given I have enter valid "email" value "testomatic@magicred.com"
    When I have enter invalid "password" value "magicred3D#" that "contains part of the email"
    And I click element "cta-button"
    #CP-327 #Then I shall be displayed an error for the "password" field - "Password for your account must be 6 or more characters long." in red
    Then I shall be displayed an error for the "password" field - "Password must not include e-mail." in red

  Scenario: User enters a valid password
    When I have enter valid "password" value I do not see the validation error message
      | userPassword                   |
      | theWind1n*                     |
      | The_will0ws                    |
      | 1$ecurePassword                |
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
    And I click element "cta-button"
    When I have enter invalid "password" value "<userPassword>" that "<type_of_error>"
    #CP-327 #Then I shall be displayed an error for the "password" field - "Password for your account must be 6 or more characters long." in red
    Then I shall be displayed an error for the "password" field - "<error_message>" in red

    Examples:
      | userPassword | type_of_error | error_message                                                                                                                                      |
      | @#$ $        | too short     | Password must be 8 characters or longer, and contain at least one of each: uppercase letters, lowercase letters, numbers, and symbols !@#$%^&*<>?_ |
      | secure       | too short     | Password must be 8 characters or longer, and contain at least one of each: uppercase letters, lowercase letters, numbers, and symbols !@#$%^&*<>?_ |
      | $EvEn7       | too short     | Password must be 8 characters or longer, and contain at least one of each: uppercase letters, lowercase letters, numbers, and symbols !@#$%^&*<>?_ |
      | password     | easy to guess | Password must be 8 characters or longer, and contain at least one of each: uppercase letters, lowercase letters, numbers, and symbols !@#$%^&*<>?_ |
      | 88888888     | easy to guess | Password must be 8 characters or longer, and contain at least one of each: uppercase letters, lowercase letters, numbers, and symbols !@#$%^&*<>?_ |

    # this is NOT the usual list of never allowed characters
  Scenario: User enters invalid characters in password multiple input errors
    When I have enter invalid characters "[]():;~{}+=|ãü木✉,\/\\\"'" into valid input "LoveG0d!s" on the "password" and I see validation error message "Password must be 8 characters or longer, and contain at least one of each: uppercase letters, lowercase letters, numbers, and symbols !@#$%^&*<>?_"
