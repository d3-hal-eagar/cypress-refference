Feature: ex/step1-content-rightRail.feature

  ex acquisition flow, display blocks of information on the right rail

  Covers
  - D3F-381 As a user when I am on Step 1 of Experian acquisition flow, I am displayed blocks of information on the right rail
  - CP-303 - SSL Logo

  Background:
    Given I am a user on the ex flow
    When I am on the ex step1 signup page


  Scenario: On the right rail I am displayed information blocks one below the other.
    Given the siteName is "NotCreditExperian"
    Then I am displayed the correct blocks on the ex Step 1 right rail
