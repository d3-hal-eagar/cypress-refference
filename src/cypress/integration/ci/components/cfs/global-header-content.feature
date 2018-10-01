Feature: cfs/global-header-content.feature

  As a user when I am on the any cfs page then I am displayed the common theme elements

  Covers
  - CP-398 Desktop/Mobile - CFS - Header Brand Logo
  - CP-428 Desktop - CFS - Header Credit Bureau Logo


  Background:
    Given I am a user on the cfs flow
    Given the siteName is "NotCheckFreeScore"


  Scenario: Landing Page Content
    Given I am on the cfs landing page
    Then I am displayed siteName in the header
    Then I am displayed flow Logo
    And The "site-link" message contains siteName
    And The "credit-bureau-logo" element shall not be hyperlinked

  Scenario: Privacy Policy Page Content
    Given I am on the cfs Privacy Policy screen
    Then I am displayed siteName in the header
    And The "credit-bureau-logo" element is not present on the page

  Scenario: Terms of Service Page Content
    Given I am on the cfs Terms of Service screen
    Then I am displayed siteName in the header
    And The "credit-bureau-logo" element is not present on the page

  Scenario: portal Page Content
    Given I am on the cfs portal page
    Then I am displayed siteName in the header

  Scenario: step1 Page Content
    Given I am on the cfs step1 page
    Then I am displayed siteName in the header
    And The "credit-bureau-logo" element shall not be hyperlinked

  Scenario: step2 Page Content
    Given I am on the cfs step2 page
    Then I am displayed siteName in the header
    And The "credit-bureau-logo" element shall not be hyperlinked

  Scenario: step3 Page Content
    Given I am on the cfs step3 page
    Then I am displayed siteName in the header
    And The "credit-bureau-logo" element shall not be hyperlinked

  Scenario: step4 Page Content
    Given I am on the cfs step4 page
    Then I am displayed siteName in the header
    And The "credit-bureau-logo" element shall not be hyperlinked
