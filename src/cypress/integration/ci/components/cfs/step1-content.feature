Feature: cfs/step1-content.feature

  Covers
  - CP-373 - Desktop/Mobile - CFS - Privacy Security Image
  - CP-520 - Desktop/Mobile - CFS - Step 1 Page - Please Provide Entreaty (copy requirement)

  Background:
    Given I am a user on the cfs flow
    Given I am on the cfs step1 page
    Given the siteName is "NotCheckFreeScore"


  #CP-373
  Scenario: 1 - Privacy Security Image shall display on the Step 1 page
    Then The "main-header-section" element present on the page
    And The "main-header-section" image is displayed on the page
    And The "main-header-section" element shall not be hyperlinked
    And The "main-header-section" message contains "Privacy Security Protected"

  #CP-520
  Scenario: 2 - Please Provide Entreaty Placement
    Then The page contians "Please provide your address to locate your credit file"
    And The page contians "Please take the time to set up your account."