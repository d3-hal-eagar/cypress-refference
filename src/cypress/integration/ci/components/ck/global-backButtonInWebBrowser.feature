Feature: Back button in the web browser

  Covers
  - CP-786 (D3F-326) Back button in the web browser
  Note: Routing Exception, User should be able to select Terms and conditions,
  Privacy policy screens either from the agreement text or from the footer links.


  Background:
    Given I am on the ck landing page
    Given I am guided to the ck landing page


  Scenario: 1 When the user is on Step1 of acquisition flow in Credit Karma and selects back button on the browser.
    When I am on the ck step1 signup page
    And I select the back button located at the top left corner of the browser
    Then I am guided to the ck landing page

  Scenario: 2a - When the user is on Step2 of acquisition flow in Credit Karma and selects back button on the browser.
    When I am on the ck step2 form page
    And I select the back button located at the top left corner of the browser
    Then I am guided to the ck step2 form page

  Scenario: 2b - When the user is on Step 3 of acquisition flow in Credit Karma and selects back button on the browser.
    When I am on the ck step3 confirm page
    And I select the back button located at the top left corner of the browser
    Then I am guided to the ck step3 confirm page

  Scenario: 2с - When the user is on the scores screen and selects back button on the browser.
    When I am on the ck portal page
    And I select the back button located at the top left corner of the browser
    Then I am guided to the ck landing page
