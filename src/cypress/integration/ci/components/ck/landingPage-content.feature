Feature: ck/landingPage-content.feature

  As a user when I am on the "ck landing" page then I am displayed the following blocks

  Covers
  - CP-91 (D3F-219) Build Credit Karma Landing Page
  - CP-822 (D3F-325) Mobile - Build Credit Karma Landing Page


  Background:
    Given I am a user on the ck flow
    Given I am on the ck landing page


  Scenario: Block 1 Hero Image
    Then I am displayed the following on the 'Hero Image' block

  Scenario: Block 2 Free Credit Score is just the beginning
    Then I am displayed the following on the 'Free Credit Score is just the beginning.' block

  Scenario: Block 3 More than a Score
    Then I am displayed the following on the 'More than a Score' block

  Scenario: Block 4 "No Credit Card Required"
    Then I am displayed the following on the 'No Credit Card Required' block

  Scenario: Block 5 We treat your data as if it was our own
    Then I am displayed the following on the 'We treat your data as if it was our own.' block

  Scenario: Block 6 It never hurts to check.
    Then I am displayed the following on the 'It never hurts to check.' block

  Scenario: Header Button See my score
    When I click element "header-signup-button"
    Then I am guided to the ck step1 signup page

  Scenario: Cta Button Let’s do it
    #When I click element "cta-signup-button"
    When I click button "Let’s do it"
    Then I am guided to the ck step1 signup page

  Scenario: Footer Button Show my score
    When I click element "footer-signup-button"
    Then I am guided to the ck step1 signup page

