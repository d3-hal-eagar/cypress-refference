Feature: ck/global-proprietaryNames.feature

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
    Given We make siteName "IasadGeas" and flow is "ck"
    Given I am a user on the ck flow
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
    Given I am on the ck landing page
    And The "site-link" message contains siteName

  Scenario: No proprietary names are displayed on the landing page
    Given I am on the ck landing page
    Then screen does not contain any proprietaryNames

  Scenario: No proprietary names are displayed on the Privacy Policy screen
    Given I am on the ck Privacy Policy screen
    Then screen does not contain any proprietaryNames

  Scenario: No proprietary names are displayed on the Terms of Service screen
    Given the following list of proprietaryNames
      | Lending Tree     |
      | Credit Sesame    |
      | MyScore          |
      | Check Free Score |
      | Credit Karma     |
      | Credmo           |
    Given I am on the ck Terms of Service screen
    Then screen does not contain any proprietaryNames

  Scenario: No proprietary names are displayed on the portal page
    Given I am on the ck portal page
    Then screen does not contain any proprietaryNames

  Scenario: No proprietary names are displayed on the step1 signup page
    Given I am on the ck step1 signup page
    Then screen does not contain any proprietaryNames

  Scenario: No proprietary names are displayed on the step2 form page
    Given I am on the ck step2 form page
    Then screen does not contain any proprietaryNames

  Scenario: No proprietary names are displayed on the step3 confirm page
    Given I am on the ck step3 confirm page
    Then screen does not contain any proprietaryNames

