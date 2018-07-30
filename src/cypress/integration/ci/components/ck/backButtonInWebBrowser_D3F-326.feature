Feature: Back button in the web browser

  Note: Routing Exception, User should be able to select Terms and conditions,
  Privacy policy screens either from the agreement text or from the footer links.

  Scenario: 1 When the user is on Step1 of acquisition flow in Credit Karma and selects back button on the browser.
  Given: I am a user
  When: I am on step 1 of Credit Karma acquisition flow
  And: I select the back button located at the top left corner of the browser
  Then: I am guided to the landing/home screen.

  Scenario: 2a - When the user is on Step2 of acquisition flow in Credit Karma and selects back button on the browser.
  Given: I am a user
  When: I am on Step 2 of Credit Karma
  And: I select the back button located at the top left corner of the browser
  Then: The screen is refreshed
  And I remain on Step 2

  Scenario: 2b - When the user is on Step 3 of acquisition flow in Credit Karma and selects back button on the browser.
    Given: I am a user
    When: I am on Step 3 of Credit Karma
    And: I select the back button located at the top left corner of the browser
    Then: The screen is refreshed
    And I remain on Step 3.

  Scenario: 2с - When the user is on the scores screen and selects back button on the browser.
    Given: I am a user
    When: I am on score screen of Credit Karma
    And: I select the back button located at the top left corner of the browser
    Then: The screen is refreshed
    And I remain on the scores screen respectively.