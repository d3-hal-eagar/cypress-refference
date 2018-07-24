Feature: ex Progress Bar

  As a user I am displayed a Progress Bar Indicator on Steps of acquisition flow so that I know the percentage of completion.

  Covers
  - D3F-479 Progress Bar Indicator on Step1, 2, 3 & 4
  - D3F-481 Mobile - Progress Bar Indicator on Step1, 2, 3 & 4

  Scenario: Progress Bar as user navigates flow
    Given I am a user on the ex flow
    When I am on the ex step1 signup page
    Then I shall be displayed the ex Progress Bar with Step1 highlighted in green as seen in the design

  Scenario: Progress Bar when the user lands on Step 2 acquisition flow screen
    Given I am a user on the ex flow
    When I am on the ex step2 form page
    Then I shall be displayed the ex Progress Bar with Step2 highlighted in green as seen in the design

  Scenario: Progress Bar when the user lands on Step 3 acquisition flow screen
    Given I am a user on the ex flow
    When I am on the ex step3 confirm page
    Then I shall be displayed the ex Progress Bar with Step3 highlighted in green as seen in the design

  Scenario: Progress Bar when the user lands on Step 4 acquisition flow screen
    Given I am a user on the ex flow
    When I am on the ex step4 verify page
    Then I shall be displayed the ex Progress Bar with Step4 highlighted in green as seen in the design

