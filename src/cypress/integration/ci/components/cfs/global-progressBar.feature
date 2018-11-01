Feature: cfs/global-progressBar.feature

  Validation scenarios for the Steps Progress Indicator displayed within CFS.

  Covers
  - CP-396 - Desktop/Mobile - CFS - Steps Progress Indicator

  Validation rules:

  - The Steps Progress Indicator shall display on Step 1, Step 2, Step 3, and Step 4
  - The Steps Progress Indicator shall exhibit active and inactive states
  - As the user advances, the respective states shall persist activated indicating progression
  - The Steps Progress Indicator shall display sequentially in the mobile view (please see Scenario 7)

  Background:
    Given I am a user on the cfs flow


  Scenario: 1 - Steps Progress Indicator is displayed within CFS Step 1 COMPLETE page
    When I am on the cfs step1 page
    Then I shall be displayed the Progress Bar Indicator as 'Step 1 - COMPLETE' as seen on the design

  Scenario: 2 - Steps Progress Indicator is displayed within CFS Step 2 CONFIRM page
    When I am on the cfs step2 page
    Then I shall be displayed the Progress Bar Indicator as 'Step 2 - CONFIRM' as seen on the design

  Scenario: 4 - Steps Progress Indicator is displayed within CFS Step 4 KBA page
    When I am on the cfs step3A authentication page
    Then I shall be displayed the Progress Bar Indicator as 'Step 4 - AUTHENTICATION' as seen on the design

  Scenario: 5 - Steps Progress Indicator is not displayed within CFS Step 4 VIEW page
    When I am on the cfs step4 view page
    Then I shall not be displayed the Progress Bar Indicator as Step 4 - VIEW
