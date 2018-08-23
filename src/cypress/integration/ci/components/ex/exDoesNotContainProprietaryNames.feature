Feature: test pages to ensure proprietary names are removed

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
    Given make siteName is "IasadGeas"
    Given I am a user on the ex flow
    Given the following list of proprietaryNames
      | Lending Tree     |
      | Credit Sesame    |
      | MyScore          |
      | Experian         |
      | Check Free Score |
      | Credit Karma     |
#      | Credmo           |


  Scenario: Testing Sitename shows in header
    Given I am on the ex landing page
    And The "site-link" message contains siteName

  Scenario: No proprietary names are displayed on the landing page
    Given I am on the ex landing page
    Then screen does not contain any proprietaryNames

  Scenario: No proprietary names are displayed on the Privacy Policy screen
    Given I am on the ex Privacy Policy screen
    Then screen does not contain any proprietaryNames

  Scenario: No proprietary names are displayed on the Terms of Service screen
    Given I am on the ex Terms of Service screen
    Then screen does not contain any proprietaryNames

#  Scenario: No proprietary names are displayed on the portal page
#    Given I am on the ex portal page
#    Then screen does not contain any proprietaryNames

  Scenario: No proprietary names are displayed on the step1 signup page
    Given I am on the ex step1 signup page
    Then screen does not contain any proprietaryNames

  Scenario: No proprietary names are displayed on the step2 form page
    Given I am on the ex step2 form page
    Then screen does not contain any proprietaryNames

  Scenario: No proprietary names are displayed on the step3 confirm page
    Given I am on the ex step3 confirm page
    Then screen does not contain any proprietaryNames

  Scenario: No proprietary names are displayed on the step4 verify page
    Given I am on the ex step4 verify page
    Then screen does not contain any proprietaryNames
