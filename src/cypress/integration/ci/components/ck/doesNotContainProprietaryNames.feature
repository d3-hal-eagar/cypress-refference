Feature: test pages to ensure proprietary names are removed

  Pages will not contain proprietaryNames (list pending)

  Background:
    Given I am a user on the ck flow
    Given the following list of proprietaryNames
      | myscore           |
      | myScore           |
      | MyScore           |
      | credit karma      |
      | Credit Karma      |
      | creditkarma       |
      | CreditKarma       |
      | experian          |
      | Experian          |
      | lendingtree       |
      | LendingTree       |
      | lending tree      |
      | Lending Tree      |
      | lendingtree       |
      | LendingTree       |
      | CheckFreeScore    |
      | checkfreescore    |
#      | credmo            |
#      | Credmo            |


  Scenario: No proprietaryNames are displayed on the landing page
    Given I am on the ck landing page
    Then screen does not contain any proprietaryNames

  Scenario: No proprietaryNames are displayed on the Privacy Policy screen
    Given I am on the ck Privacy Policy screen
    Then screen does not contain any proprietaryNames

  Scenario: No proprietaryNames are displayed on the Terms of Service screen
    Given I am on the ck Terms of Service screen
    Then screen does not contain any proprietaryNames

  Scenario: No proprietaryNames are displayed on the portal page
    Given I am on the ck portal page
    Then screen does not contain any proprietaryNames

  Scenario: No proprietaryNames are displayed on the step1 signup page
    Given I am on the ck step1 signup page
    Then screen does not contain any proprietaryNames

  Scenario: No proprietaryNames are displayed on the step2 form page
    Given I am on the ck step2 form page
    Then screen does not contain any proprietaryNames

  Scenario: No proprietaryNames are displayed on the step3 confirm page
    Given I am on the ck step3 confirm page
    Then screen does not contain any proprietaryNames

