Feature: Header, Footer, Terms of Service and Privacy Policy

  As a user I shall be displayed the footer on all screens.
  Covers
   - D3F-36 Footer, Terms of Service and Privacy Policy
   - D3F-334 Mobile - Build Footer
   - D3F-49 Terms of Service & Privacy Policy
   - D3F-335 Mobile - Terms of Service & Privacy Policy


  Background:
    Given the siteName is "NotCreditKarma"
    Given I am a user on the ck flow


  Scenario: 1 Footer shall contain Copyright, Terms of Service & Privacy Policy
    When I am on the ck step1 signup page
    Then I am displayed siteName in the header
    #Then I am displayed ck Footer
    And I am displayed "Terms Of Service" Hyperlinked to "/ck/tos"
    And "/ck/tos" Hyperlinked targets opening in a new tab
    And I am displayed "Privacy Policy" Hyperlinked to "/ck/privacy"
    And "/ck/privacy" Hyperlinked targets opening in a new tab
    And I am displayed Copyright - © 2018 siteName. All Rights Reserved in the footer

  Scenario: 2 User is displayed the following on Terms of Service screen
    When I am on the ck Terms of Service screen
    Then I am displayed ck Logo
    Then I am displayed ck Terms of Service Text
    Then I am displayed ck Footer

  Scenario: 3 User is displayed the following on Privacy Policy screen
    When I am on the ck Privacy Policy screen
    Then I am displayed ck Logo
    Then I am displayed ck Privacy Policy Text
    Then I am displayed ck Footer

  Scenario: 4 User is displayed the following on step2 form page
    When I am on the ck step2 form page
    Then I am displayed ck Logo
    Then I am displayed ck Footer

  Scenario: 5 User is displayed the following on step3 confirm page
    When I am on the ck step3 confirm page
    Then I am displayed ck Logo
    Then I am displayed ck Footer
