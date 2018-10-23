Feature: cfs/global-proprietaryNames.feature

  Pages will not contain proprietaryNames (list pending)
  provide the name with spaces
  Test will check for permutations of the test with
    - aS iS
    - aSiS-unspaced
    - Title Case
    - TitleCase-Unspaced
    - lower case
    - lowercase-unspaced
    - Sentence case
    - Sentencecase-unspaced
    - camelCase


  Background:
    Given We make siteName "IasadGeas" and flow is "cfs"
    Given I am a user on the cfs flow
    Given the siteName is "IasadGeas"
    Given the following list of proprietaryNames
      | Lending Tree     |
      | Credit Sesame    |
      | MyScore          |
      | Experian         |
      | Check Free Score |
      | Credit Karma     |
      | Credmo           |


  Scenario: Testing Sitename shows in header
    Given I am on the cfs landing page
    And The "site-link" message contains siteName

  Scenario: No proprietary names are displayed on the landing page
    Given I am on the cfs landing page
    Then screen does not contain any proprietaryNames

  Scenario: No proprietary names are displayed on the Privacy Policy screen
    Given I am on the cfs Privacy Policy screen
    Then screen does not contain any proprietaryNames

  Scenario: No proprietary names are displayed on the Terms of Service screen
    Given the following list of proprietaryNames
      | Lending Tree     |
      | Credit Sesame    |
      | MyScore          |
      | Check Free Score |
      | Credit Karma     |
      | Credmo           |
    Given I am on the cfs Terms of Service screen
    Then screen does not contain any proprietaryNames

  Scenario: No proprietary names are displayed on the portal page
    Given Given I am on the cfs step 4 view page
    Then screen does not contain any proprietaryNames

  Scenario: No proprietary names are displayed on the step1 signup page
    Given I am on the cfs step1 page
    Then screen does not contain any proprietaryNames

  Scenario: No proprietary names are displayed on the step2 form page
    Given I am on the cfs step2 page
    Then screen does not contain any proprietaryNames

  Scenario: No proprietary names are displayed on the step3A verify page
    Given I am on the cfs step3A authentication page page
    Then screen does not contain any proprietaryNames
