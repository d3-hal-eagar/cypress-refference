Feature: cfs/step2-content.feature

  Covers
  - CP-373

  Background:
    Given I am a user on the cfs flow
    Given I am on the cfs step2 page
    Given the siteName is "NotCheckFreeScore"


  Scenario: 1 - Step 2 Page
    Then The "main-header-section" element present on the page
    And The "main-header-section" image is displayed on the page
    And The "main-header-section" element shall not be hyperlinked
    And The "main-header-section" message contains "Privacy Security Protected"
