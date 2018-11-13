  Feature: ex/step2-content.feature

  As a user when I am on Step 2 of acquisition flow then I am displayed the form fields

  covers
  - CP-421 Step 2 - Identity Verification Field Elements
    (formerly D3F-459)
  - CP-764 (D3F-492) Mobile - Step 2 - Identity Verification Field Elements
  - CP-303 - SSL Logo
  - CP-421 Desktop - EX - Step 2 - Identity Verification Field Elements


  Background: user on Step 2 acquisition flow screen
    Given I am a user on the ex flow
    Given I am on the ex step2 form page
    Given the siteName is "NotCreditExperian"


  Scenario: On the right rail I am displayed information blocks one below the other (expected fail)
    Then I am displayed the correct blocks on the ex Step 2 right rail
