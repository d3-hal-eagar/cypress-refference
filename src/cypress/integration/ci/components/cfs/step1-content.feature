Feature: cfs/step1-content.feature

  Covers
  - CP-373

  Background:
    Given I am a user on the cfs flow
    Given I am on the cfs step1 page
    Given the siteName is "NotCheckFreeScore"


  Scenario: 1 - Privacy Security Image shall display on the Step 1 page
    Then The "main-header-section" element present on the page
    And The "main-header-section" image is displayed on the page
    And The "main-header-section" element shall not be hyperlinked
    And The "main-header-section" message contains "Privacy Security Protected"