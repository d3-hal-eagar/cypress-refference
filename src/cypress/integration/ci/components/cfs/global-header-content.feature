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
    #Then I am displayed siteName in the header
    Then I am displayed flow Logo
    And The "nav-bureaus" element shall not be hyperlinked

  Scenario: Privacy Policy Page Content
    Given I am on the cfs Privacy Policy screen
    Then I am displayed flow Logo
    And The "nav-bureaus" element shall not be hyperlinked

  Scenario: Terms of Service Page Content
    Given I am on the cfs Terms of Service screen
    Then I am displayed flow Logo
    And The "nav-bureaus" element shall not be hyperlinked

  Scenario: portal Page Content aka step 4 view
    Given Mock Report for "Donald Blair"
    Given I am on the cfs step4 view page
    Then I am displayed flow Logo

  Scenario: step1 Page Content
    Given I am on the cfs step1 page
    Then I am displayed flow Logo
    And The "nav-bureaus" element shall not be hyperlinked

  Scenario: step2 Page Content
    Given I am on the cfs step2 page
    Then I am displayed flow Logo
    And The "nav-bureaus" element shall not be hyperlinked

  Scenario: step3A Page Content authentication
    Given I am on the cfs step3A authentication page
    Then I am displayed flow Logo
    And The "nav-bureaus" element shall not be hyperlinked

  Scenario: step3C CC Page Content
    Given Mock KBA pass
    And Mock scores-quick "812"
    When I fill out kba questions and stop
    And I click on the "cta-button" field
    Then The "modal-body" message contains "Processing questions, please wait..."
    And Wait for not exists ".loading-modal"
    And I am guided to the cfs step3A authentication page
    And I am displayed flow Logo
    And The "nav-bureaus" element shall not be hyperlinked