Feature: CK Progress Bar

  As a user I am displayed a Progress Bar Indicator on Steps of acquisition flow so that I know the percentage of completion.

  Scenario: Progress Bar as user navigates flow
    Given I am a user on the ck flow
    When I am on the ck step1 signup page
    Then I shall be displayed the Progress Bar with Step1 highlighted in green as seen in the design

  Scenario: Progress Bar when the user lands on Step 2 acquisition flow screen
    Given I am a user on the ck flow
    When I am on the ck step2 form page
    Then I shall be displayed the Progress Bar with Step2 highlighted in green as seen in the design

  Scenario: Progress Bar when the user lands on Step 3 acquisition flow screen
    Given I am a user on the ck flow
    When I am on the ck step3 confirm page
    Then I shall be displayed the Progress Bar with Step3 highlighted in green as seen in the design
