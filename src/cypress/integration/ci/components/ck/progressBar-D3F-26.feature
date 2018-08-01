Feature: CK Progress Bar

  As a user I am displayed a Progress Bar Indicator on Steps of acquisition flow so that I know the percentage of completion.

  Covers
  - D3F-26 As a user I am displayed a Progress Bar Indicator in step 1 of acquisition flow so that I know the percentage of completion
  - D3F-331 Mobile - As a user I am displayed a Progress Bar Indicator in step 1 of acquisition flow
  - D3F-127 As a user when I am on Step 2 of acquisition flow then I am displayed the Progress Indicator so that I know the percentage completed
  - D3F-358 Mobile - As a user when I am on Step 2 of acquisition flow then I am displayed the Progress Indicator
  - D3F-339 As a user when I am on Step 3 of acquisition flow then I am displayed the Progress Indicator
  - D3F-373 Mobile - As a user when I am on Step 3 of acquisition flow then I am displayed the Progress Indicator

  Background:
    Given I am a user on the ck flow


  Scenario: Progress Bar as user navigates flow
    When I am on the ck step1 signup page
    Then I shall be displayed the Progress Bar with Step1 highlighted in green as seen in the design

  Scenario: Progress Bar when the user lands on Step 2 acquisition flow screen
    When I am on the ck step2 form page
    Then I shall be displayed the Progress Bar with Step2 highlighted in green as seen in the design

  Scenario: Progress Bar when the user lands on Step 3 acquisition flow screen
    When I am on the ck step3 confirm page
    Then I shall be displayed the Progress Bar with Step3 highlighted in green as seen in the design
