Feature: Header, Footer, Terms of Service and Privacy Policy

  As a user I shall be displayed the footer on all screens.
  Covers
   - CP-453 Desktop - EX - Build Footer, Terms of Service and Privacy Policy
   - CP-789Mobile - EX - Build Footer, Terms of Service and Privacy Policy


  Background:
    Given the siteName is "NotCreditExperian"
    Given I am a user on the ex flow

  Scenario: 1 Footer shall contain Copyright, Terms of Service & Privacy Policy
    When I am on the ex step1 signup page
    Then I am displayed siteName in the header
    And "tos-link on <footer>" with text "Terms Of Service" Hyperlinked to "/ex/tos"
    And "tos-link on <footer>" targets opening in a new tab
    And "privacy-link on <footer>" with text "Privacy Policy" Hyperlinked to "/ex/privacy"
    And "privacy-link on <footer>" targets opening in a new tab
    And I am displayed Copyright - © 2018 siteName. All Rights Reserved in the footer

  Scenario: 2 User is displayed the following on step2 form page
    When I am on the ex step2 form page
    Then I am displayed ck Logo
    Then I am displayed ck Footer
    And "tos-link on terms" with text "Terms Of Service" Hyperlinked to "/ex/tos"
    And "tos-link on terms" targets opening in a new tab
    And "privacy-link on terms" with text "Privacy Policy" Hyperlinked to "/ex/privacy"
    And "privacy-link on terms" targets opening in a new tab

  Scenario: 3 User is displayed the following on ck step3 screen
    When I am on the ex step3 confirm page
    Then I am displayed ck Logo
    Then I am displayed ck Footer

  Scenario: 4 User is displayed the following on Terms of Service screen
    When I am on the ex Terms of Service screen
    Then I am displayed ck Logo
    Then I am displayed ck Terms of Service Text
    And The "section-title in tos-section" message contains siteName
    And The "<p> in tos-section" message contains siteName
    Then I am displayed ck Footer

  Scenario: 5 User is displayed the following on Privacy Policy screen
    When I am on the ex Privacy Policy screen
    Then I am displayed ck Logo
    Then I am displayed ck Privacy Policy Text
    And The "<p> in privacy-section" message contains siteName
    Then I am displayed ck Footer

  Scenario: 6 User is displayed the following on ck landing screen
    When I am on the ex landing page
    Then I am displayed ck Logo
    Then I am displayed ck Footer

  Scenario: 7 User is displayed the following on step4 verify page
    When I am on the ex step4 verify page
    Then I am displayed ck Logo
    Then I am displayed ck Footer
