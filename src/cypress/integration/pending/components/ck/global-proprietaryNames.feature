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


  Scenario: No proprietary names are displayed on the Privacy Policy screen
    Given I am on the ck Privacy Policy screen
    Then screen does not contain any proprietaryNames
