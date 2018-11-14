Feature: cfs/global-footer-content.feature

  As a user when I am on the any cfs page then I am displayed the common theme elements

  Covers
  - CP-317 Desktop/Mobile - CFS - Footer Legalese
  - CP-404(Deprecated) Desktop/Mobile - CFS - Privacy Policy Page Option
  - CP-410 (Deprecated) Desktop/Mobile - CFS - Terms of Service Option
  - CP-2713 Desktop - CFS - Landing Page - Contact Us Option (Revision to CP-326)

  Background:
    Given I am a user on the cfs flow
    Given the siteName is "NotCheckFreeScore"


  Scenario: Step 1 Footer shall contain Copyright, Terms of Service, Privacy Policy, and Contact Us
    When I am on the cfs step1 page
    Then I am displayed flow Footer
    #Then I am displayed flow Footer
    And "tos-link on <footer>" with text "Terms Of Service" Hyperlinked to "/cfs/tos"
    And "tos-link on <footer>" targets opening in a new tab
    And "privacy-link on <footer>" with text "Privacy Policy" Hyperlinked to "/cfs/privacy"
    And "privacy-link on <footer>" targets opening in a new tab

    And I am displayed Copyright - © 2018 siteName. All Rights Reserved in the footer
    And The "<footer>" message contains "Important Information: The credit score(s) you receive from us may not be the same scores used by lenders or other commercial users for credit decisions. There are various types of credit scores, and lenders may use a different type of credit score to make lending decisions than the ones being offered."
    And The "<footer>" message contains "Under federal law you have the right to receive a Credit Report from each of the three nationwide consumer reporting agencies once every 12 months. A Credit Score is not included."
    And The "<footer>" message contains "After verification of your identity, your scores are available for immediate online delivery securely. Scores shown are for illustrative purposes only."
    And The "<footer>" message contains "provides you with the tools you need to access and monitor your financial profile through the program's credit reporting and monthly monitoring benefits."
    And The "<footer>" message contains "redit Monitoring and its benefit providers are not credit repair service providers and do not receive fees for such services, nor are they credit clinics, credit repair or credit services organizations or businesses."
    And The "<footer>" message contains "Credit information is provided either by Transunion® and TransUnion Interactive, Inc. or Experian and CSIdentity Corporation."
    And The "<footer>" message contains "All product and company names and trademarks mentioned herein are the property of their respective owners."
    And The "<footer>" message contains siteName

  Scenario: Step 4 Footer shall contain Copyright, Terms of Service, Privacy Policy, and Contact Us
    When I am on the cfs step3A authentication page
    Then I am displayed flow Footer
    #Then I am displayed flow Footer
    And "tos-link on <footer>" with text "Terms Of Service" Hyperlinked to "/cfs/tos"
    And "tos-link on <footer>" targets opening in a new tab
    And "privacy-link on <footer>" with text "Privacy Policy" Hyperlinked to "/cfs/privacy"
    And "privacy-link on <footer>" targets opening in a new tab

    And I am displayed Copyright - © 2018 siteName. All Rights Reserved in the footer
    And The "<footer>" message contains "Important Information: The credit score(s) you receive from us may not be the same scores used by lenders or other commercial users for credit decisions. There are various types of credit scores, and lenders may use a different type of credit score to make lending decisions than the ones being offered."
    And The "<footer>" message contains "Under federal law you have the right to receive a Credit Report from each of the three nationwide consumer reporting agencies once every 12 months. A Credit Score is not included."
    And The "<footer>" message contains "After verification of your identity, your scores are available for immediate online delivery securely. Scores shown are for illustrative purposes only."
    And The "<footer>" message contains "provides you with the tools you need to access and monitor your financial profile through the program's credit reporting and monthly monitoring benefits."
    And The "<footer>" message contains "redit Monitoring and its benefit providers are not credit repair service providers and do not receive fees for such services, nor are they credit clinics, credit repair or credit services organizations or businesses."
    And The "<footer>" message contains "Credit information is provided either by Transunion® and TransUnion Interactive, Inc. or Experian and CSIdentity Corporation."
    And The "<footer>" message contains "All product and company names and trademarks mentioned herein are the property of their respective owners."
    And The "<footer>" message contains siteName

  Scenario: Landing Page Content
    Given I am on the cfs landing page
    Then I am displayed flow Footer
    And "tos-link on <footer>" with text "Terms Of Service" Hyperlinked to "/cfs/tos"
    And "tos-link on <footer>" targets opening in a new tab
    And "privacy-link on <footer>" with text "Privacy Policy" Hyperlinked to "/cfs/privacy"
    And "privacy-link on <footer>" targets opening in a new tab

    And I am displayed Copyright - © 2018 siteName. All Rights Reserved in the footer
    And The "<footer>" message contains "Important Information: The credit score(s) you receive from us may not be the same scores used by lenders or other commercial users for credit decisions. There are various types of credit scores, and lenders may use a different type of credit score to make lending decisions than the ones being offered."
    And The "<footer>" message contains "Under federal law you have the right to receive a Credit Report from each of the three nationwide consumer reporting agencies once every 12 months. A Credit Score is not included."
    And The "<footer>" message contains "After verification of your identity, your scores are available for immediate online delivery securely. Scores shown are for illustrative purposes only."
    And The "<footer>" message contains "provides you with the tools you need to access and monitor your financial profile through the program's credit reporting and monthly monitoring benefits."
    And The "<footer>" message contains "redit Monitoring and its benefit providers are not credit repair service providers and do not receive fees for such services, nor are they credit clinics, credit repair or credit services organizations or businesses."
    And The "<footer>" message contains "Credit information is provided either by Transunion® and TransUnion Interactive, Inc. or Experian and CSIdentity Corporation."
    And The "<footer>" message contains "All product and company names and trademarks mentioned herein are the property of their respective owners."
    And The "<footer>" message contains siteName

  Scenario: Privacy Policy Page Content
    Given I am on the cfs Privacy Policy screen
    Then I am displayed flow Footer
    Then I am displayed flow Privacy Policy Text
    And The "<p> in privacy-section" message contains siteName

  Scenario: Terms of Service Page Content
    Given I am on the cfs Terms of Service screen
    Then I am displayed flow Footer
    Then I am displayed flow Terms of Service Text
#    And The "section-title in tos-section" message contains siteName
    And The "<p> in tos-section" message contains siteName

  Scenario: portal Page Content
    Given Mock Report for "Donald Blair"
    Given I am on the cfs step4 view page
    Then I am displayed flow Footer

  Scenario: step2 Page Content
    Given I am on the cfs step2 page
    Then I am displayed flow Footer

  #CP-2713
  @CP-2713
  Scenario: Landing Page Contact Us Option
    Given I am on the cfs landing page
    And The "modal-link on <footer>" message contains "Contact Us"
    When I click "Contact Us"
    Then The "close-button" element present on the modal header
    And The "<img.img-responsive on modal-body" element present on the modal
    And I am displayed the correct message in the desktop modal only
      """
      Instantly Access Your 3 Credit Scores
      """
    And I am displayed the correct message in the desktop modal only
      """
      Secure Online Delivery
      """
    And I am displayed the correct message in the desktop modal only
      """
      Daily 3 Bureau Credit Monitoring
      """
    And I am displayed the correct message in the desktop modal only
      """
      Roadside Assistance
      """
    And I am displayed the correct message in the modal
      """
      Need to contact us?
      """
    And I am displayed the correct message in the modal
      """
      We're always here to help! Please call our friendly, knowledgeable customer service representatives today at:
      """
    And I am displayed the correct message in the modal
      """
      (855) 506-9160
      """
    And I am displayed the correct message in the modal
      """
      It's our goal to provide the best possible membership experience!
      """
    And I am displayed the correct message in the modal
      """
      Need to mail us something? Please address to:
      """
    And I am displayed the correct message in the modal
      """
      RE: Customer Service
      """
    And I am displayed the correct message in the modal
      """
      5100 Buckeystown Pike, Suite 250
      """
    And I am displayed the correct message in the modal
      """
      Frederick, MD 21704
      """
    And The "modal-body" message contains siteName
    When I close the modal
    Then the modal is not visible

  Scenario: step1 tos-link
    Given I am on the cfs step2 page
    When I remove link target from "tos-link on <footer>"
    When I focus on the "cta-button" field
    When I blur the "cta-button" field
    #todo fix flaky test sometimes get mysterious error 'SecurityError: Blocked a frame with origin "http://localhost:4200" from accessing a cross-origin frame.'
#    When I click element "tos-link on <footer>"
#    Then I am guided to the cfs Terms of Service screen

  Scenario: step2 privacy-link
    Given I am on the cfs step2 page
    When I remove link target from "privacy-link on <footer>"
    When I focus on the "cta-button" field
    When I blur the "cta-button" field
    #todo fix flaky test sometimes get mysterious error 'SecurityError: Blocked a frame with origin "http://localhost:4200" from accessing a cross-origin frame.'
#    When I click element "privacy-link on <footer>"
#    Then I am guided to the cfs Privacy Policy screen
