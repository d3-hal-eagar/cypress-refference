Feature: ex/global-footerTermsPrivacy.feature

  Header, Footer, Terms of Service and Privacy Policy

  As a user I shall be displayed the footer on all screens.
  Covers
   - CP-453 Desktop - EX - Build Footer, Terms of Service and Privacy Policy
   - CP-789Mobile - EX - Build Footer, Terms of Service and Privacy Policy

  - bugs open CP-495, CP-390, CP-292

  Background:
    Given I am a user on the ex flow
    Given the siteName is "NotCreditExperian"

  Scenario: 1 Footer shall contain Copyright, Terms of Service & Privacy Policy (expected fail)
    When I am on the ex step1 signup page
    And "tos-link on <footer>" with text "Terms Of Service" Hyperlinked to "/ex/tos"
    And "tos-link on <footer>" targets opening in a new tab
    And "privacy-link on <footer>" with text "Privacy Policy" Hyperlinked to "/ex/privacy"
    And "privacy-link on <footer>" targets opening in a new tab
    And I am displayed Copyright - © 2018 siteName. All Rights Reserved in the footer
    Then I am displayed siteName in the header

  Scenario: 2 User is displayed the following on step2 form page (expected fail)
    When I am on the ex step2 form page
    #Then I am displayed flow Logo
    Then I am displayed siteName in the header
    Then I am displayed flow Footer
    And "tos-link on terms" with text "Terms Of Use Agreement" Hyperlinked to "/ex/tos"
    And "tos-link on terms" targets opening in a new tab
    And "privacy-link on terms" with text "Privacy Policy" Hyperlinked to "/ex/privacy"
    And "privacy-link on terms" targets opening in a new tab
    Then I am displayed siteName in the header

  Scenario: 3 User is displayed the following on ck step3 screen (expected fail)
    When I am on the ex step3 confirm page
    #Then I am displayed flow Logo
    Then I am displayed siteName in the header
    Then I am displayed flow Footer
    Then I am displayed siteName in the header
    When I click element "privacy-link on <footer>"
    Then I am guided to the ex Privacy Policy screen

  Scenario: 4 User is displayed the following on Terms of Service screen (expected fail)
    When I am on the ex Terms of Service screen
    #Then I am displayed flow Logo
    Then I am displayed siteName in the header
    Then I am displayed flow Terms of Service Text
    And The "section-title in tos-section" message contains siteName
    And The "<p> in tos-section" message contains siteName
    Then I am displayed flow Footer
    Then I am displayed siteName in the header

  Scenario: 5 User is displayed the following on Privacy Policy screen (expected fail)
    When I am on the ex Privacy Policy screen
    #Then I am displayed flow Logo
    Then I am displayed siteName in the header
    Then I am displayed flow Privacy Policy Text
    And The "<p> in privacy-section" message contains siteName
    Then I am displayed flow Footer
    Then I am displayed siteName in the header

  Scenario: 6 User is displayed the following on ck landing screen (expected fail)
    When I am on the ex landing page
    #Then I am displayed flow Logo
    Then I am displayed siteName in the header
    Then I am displayed flow Footer
    Then I am displayed siteName in the header

  Scenario: 7 User is displayed the following on step4 verify page (expected fail)
    When I am on the ex step4 verify page
    #Then I am displayed flow Logo
    Then I am displayed siteName in the header
    Then I am displayed flow Footer
    Then I am displayed siteName in the header
    When I click element "tos-link on <footer>"
    Then I am guided to the ex Terms of Service screen
