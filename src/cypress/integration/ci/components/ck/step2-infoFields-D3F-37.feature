Feature: Step2 info fields

  As a user when I am on Step 2 of acquisition flow then I am displayed the form fields

  covers
  - D3F-37 As a user when I am on Step 2 of acquisition flow then I am displayed the form fields
  - D3F-338 Mobile - As a user when I am on Step 2 of acquisition flow then I am displayed the form fields

  Background: user on Step 2 acquisition flow screen
    Given I am a user on the ck flow
    When I am on the ck step2 form page

  Scenario: 1 - test existence of form fields

    When I focus on the "firstName" field
    When I focus on the "lastName" field
    When I focus on the "street1" field
    When I focus on the "street2" field
    When I focus on the "ssn3" field

    When I focus on the "city" field
    When I focus on the "state" field
    When I focus on the "zip" field
    When I focus on the "dobMonth" field
    When I focus on the "dobDay" field
    When I focus on the "dobYear" field
    When I focus on the "agreement" field
    When I focus on the "next-step-button" field

  Scenario: 2 - test existence of messages
    Given the siteName is "NotCreditKarma"
    Then The page header is "You're on your way to free credit scores."
    Then The "terms" message contains "By clicking on "Next Step", you agree to"
    Then The "terms" message contains "Terms Of Use, including our Privacy Policy"
    Then The "terms" message contains siteName
    Then The "account-created-section" message contains "Account Created! Your account is now created for the following email address: "

  Scenario: 3 - agreement text and site name token
    Then The "agreement-text" message contains siteName
    Then The "agreement-text" message contains "I understand that I am providing written instructions in accordance with the Fair Credit Reporting Act and other applicable law for "
    Then The "agreement-text" message contains "or its affiliated companies to request and receive copies of consumer reports, scores and related information about me from third parties, including, but not limited to, TransUnion. I understand that my instructions let"
    Then The "agreement-text" message contains "and affiliated companies obtain such information at any time for as long as I have a registered"
    Then The "agreement-text" message contains "account to use as described in the Terms of Service and Privacy Policy."

