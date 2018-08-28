Feature: Step 1 Create your account fields

  Covers
  - D3F-27 Create your account fields
  - D3F-332 Mobile - Create your account fields
  - D3F-217 As a user when I am on Step 1 of acquisition path, I am displayed blocks of information on the right rail


  Background:
    Given I am a user on the ck flow
    Given I am on the ck step1 signup page


  Scenario: As a user when I am on Step 1 of acquisition path, I am displayed blocks of information on the right rail
    #D3F-217
    Given the siteName is "NotCreditKarma"
    Then I am displayed the correct blocks on the ck Step 1 right rail

    #D3F-27
  Scenario: System applies a blue glow border around active form elements
    Then The page header is "You're on your way to free credit scores."
    When I click on the "email" field
    Then Check that the "email" field is focused
    And The "email" field label is "Email Address"
    When I click on the "password" field
    Then Check that the "password" field is focused
    And The "password" field label is "Create Password"
    And I focus on the "next-step-button" field
    Then Action detail "all fields were present"

  Scenario: 2 - Test for terms message and site name token
    Given the siteName is "NotCreditKarma"
    Then The page header is "You're on your way to free credit scores."
    And The "terms" message contains "By clicking on "Next Step", you agree to"
    And The "terms" message contains "Terms Of Service, including our Privacy Policy"
    And The "terms" message contains siteName
