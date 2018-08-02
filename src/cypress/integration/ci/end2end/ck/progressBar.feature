Feature: CK Progress Bar

  As a user I am displayed a Progress Bar Indicator on Steps of acquisition flow so that I know the percentage of completion.
  This is an over simplified end2end test being used a placeholder to show intended strucure of test files.

  Scenario: Progress Bar when the user lands on Step 1 acquisition flow screen
    Given I am a user on the ck flow
    When I am on the ck landing page
    Then I shall not be displayed the Progress Bar
    #And I select 'See my score'
    And I click element "header-signup-button"
    Then I shall be displayed the Progress Bar with Step1 highlighted in green as seen in the design
    #And I select 'Next Step'
    And I click element "next-step-button"
    Then I shall be displayed the Progress Bar with Step2 highlighted in green as seen in the design
    #And I select 'Next Step'
    And I click element "next-step-button"
    Then I shall be displayed the Progress Bar with Step3 highlighted in green as seen in the design
