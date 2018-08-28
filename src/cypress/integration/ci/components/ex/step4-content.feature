Feature: Step4 verify fields

  As a user when I am on Step 4 of acquisition flow then I am displayed the form fields

  covers
  - CP-768 - Desktop Build Protect Your Account Screen
  - CP-813 - Your Order Summary in Step 4
  - CP-303 - SSL Logo

  Background: user on Step 2 acquisition flow screen
    Given I am a user on the ex flow
    Given I am on the ex step4 verify page
    #Given the siteName is "NotExperian"


  Scenario: 1 - test existence of form fields
    When I focus on the "s-question" field
    And I focus on the "s-answer" field
    And I focus on the "pin" field
    And I focus on the "confirm-pin" field
    And I focus on the "cQuestion" field
    Then Action detail "all fields were present"

  Scenario: 2 - test existence of headers
    Then The form title is "Protect Your Account"
    And The form header is "Account Security"

  Scenario: 3 - On the right rail I am displayed information blocks one below the other
    Then I am displayed the right rail Order Summary block
    And I am displayed the right rail Secure block
