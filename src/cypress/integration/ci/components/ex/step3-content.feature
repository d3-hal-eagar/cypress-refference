Feature: Step 3 verify fields

  As a user when I am on Step 3 of acquisition flow then I am displayed the form fields

  covers
  - CP-813 - Your Order Summary in Step 4
  - CP-303 - SSL Logo

  Background: user on Step 3 acquisition flow screen
    Given I am a user on the ex flow
    Given I am on the ex step3 confirm page
    Given the siteName is "NotExperian"

  Scenario: 1 - On the right rail I am displayed information blocks one below the other
    Then I am displayed the right rail Order Summary block
    And I am displayed the right rail Secure block
