Feature: ck/global-footerTermsPrivacy.feature

  As a user I shall be displayed the footer on all screens.
  Covers
   - CP-77 (D3F-36) Footer, Terms of Service and Privacy Policy
   - CP-81 (D3F-334) Mobile - Build Footer
   - CP-823 (D3F-49) Terms of Service & Privacy Policy
   - CP-833 (D3F-335) Mobile - Terms of Service & Privacy Policy
   - CP-770 Desktop/Mobile - CK - Remove address from Terms of Service and Privacy Policy


  Background:
    Given I am a user on the ck flow
    Given the siteName is "NotCreditKarma"


  Scenario: 1 Footer shall contain Copyright, Terms of Service & Privacy Policy
    When I am on the ck step1 signup page
    Then I am displayed siteName in the header
    #Then I am displayed flow Footer
    And "tos-link on <footer>" with text "Terms Of Service" Hyperlinked to "/ck/tos"
    And "tos-link on <footer>" targets opening in a new tab
    And "privacy-link on <footer>" with text "Privacy Policy" Hyperlinked to "/ck/privacy"
    And "privacy-link on <footer>" targets opening in a new tab
    And I am displayed Copyright - © 2018 siteName. All Rights Reserved in the footer
    And "ck-tos-link on terms" with text "Terms Of Service" Hyperlinked to "/ck/tos"
    And "ck-tos-link on terms" targets opening in a new tab
    And "ck-privacy-link on terms" with text "Privacy Policy" Hyperlinked to "/ck/privacy"
    And "ck-privacy-link on terms" targets opening in a new tab

  Scenario: 2 User is displayed the following on step2 form page
    When I am on the ck step2 form page
    Then I am displayed flow Logo
    Then I am displayed flow Footer
    And "ck-tos-link on terms" with text "Terms Of Service" Hyperlinked to "/ck/tos"
    And "ck-tos-link on terms" targets opening in a new tab
    And "ck-privacy-link on terms" with text "Privacy Policy" Hyperlinked to "/ck/privacy"
    And "ck-privacy-link on terms" targets opening in a new tab
    #note this is funky the capitalization is different but approved this way
    And "ck-tos-link on agreement-text" with text "Terms of Service" Hyperlinked to "/ck/tos"
    And "ck-tos-link on agreement-text" targets opening in a new tab
    And "ck-privacy-link on agreement-text" with text "Privacy Policy" Hyperlinked to "/ck/privacy"
    And "ck-privacy-link on agreement-text" targets opening in a new tab

  Scenario: 3 User is displayed the following on ck step3 screen
    When I am on the ck step3 confirm page
    Then I am displayed flow Logo
    Then I am displayed flow Footer
    When I click element "privacy-link on <footer>"
    Then I am guided to the ck Privacy Policy screen

  Scenario: 4 User is displayed the following on Terms of Service screen
    When I am on the ck Terms of Service screen
    Then I am displayed flow Logo
    Then I am displayed flow Terms of Service Text
    And The "section-title in tos-section" message contains siteName
    And The "<p> in tos-section" message contains siteName
    Then I am displayed flow Footer

  Scenario: 5 User is displayed the following on Privacy Policy screen
    When I am on the ck Privacy Policy screen
    Then I am displayed flow Logo
    Then I am displayed flow Privacy Policy Text
    And The "<p> in privacy-section" message contains siteName
    Then I am displayed flow Footer

  Scenario: 6 User is displayed the following on ck landing screen
    When I am on the ck landing page
    Then I am displayed flow Logo
    Then I am displayed flow Footer
    When I click element "tos-link on <footer>"
    Then I am guided to the ck Terms of Service screen


