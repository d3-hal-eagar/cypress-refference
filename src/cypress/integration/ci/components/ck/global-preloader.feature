Feature: ck/global-preloader.feature

  As a user on completing step 3 of acquisition flow and selecting Get my score when all my answers are correct and I am authenticated, then I will be displayed a preloading screen as seen in the UX.

  covers
  - CP-804 Desktop - CK - Preloading screen
  - CP-842 Mobile - CK - Preloading screen

  Background: user on Step 2 acquisition flow screen
    Given I am a user on the ck flow
    Given I am on the ck step3 confirm page


  Scenario: Answer all KBA correctly

    #When I click "Get my score"
    When I click element "loader-button"
    #todo When all my answers are correct and I am authenticated
    Then I will be displayed a preloading screen


