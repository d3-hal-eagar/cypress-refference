Feature: Step2 info fields

  As a user when I am on Step 2 of acquisition flow then I am displayed the form fields

  covers
  - CP-421 Step 2 - Identity Verification Field Elements
    (formerly D3F-459)
  - D3F-492 Mobile - Step 2 - Identity Verification Field Elements

  Background: user on Step 2 acquisition flow screen
    Given I am a user on the ex flow
    When I am on the ex step2 form page
    Given the siteName is "NotCreditKarma"

  Scenario: 1 - test existence of form fields

    Then I focus on the "ssn3" field
    And I focus on the "ssn" field
    And I focus on the "ssn-display-checkbox" field
    And I focus on the "dobMonth" field
    And I focus on the "dobDay" field
    And I focus on the "dobYear" field
    And I focus on the "username" field
    And I focus on the "password" field
    And I focus on the "cofirmPassword" field
    And I focus on the "submit-button" field

  Scenario: 2 - test existence of messages and site name token
    #Then The page header is "Create Your Account"
    Then The "account-section-title" message contains "Create Your Account"
    And The a subheader exists "Identity Verification"
    And The page contians "Why do we need this?"
    And The a subheader exists "Account Information"
    Then The "terms" message contains "By clicking on "Submit Secure Order": you agree to"
    Then The "terms" message contains "Terms Of Use, including our Privacy Policy"
    Then The "terms" message contains siteName

  Scenario: On the right rail I am displayed information blocks one below the other.
    Then I am displayed the correct blocks on the ex Step 2 right rail

  Scenario: Text for "Why do we need this?"
    When I click "Why do we need this?"
    Then I am displayed the correct message in the modal header "Why do you need my Social Security Number?"
    And I am displayed the correct message in the modal
      """
      Your Social Security Number is used to verify your identity so we can securely retrieve your credit information. This measure is in place to prevent illegal access to your credit information and exists for your protection.
      """
    And I am displayed the correct message in the modal
      """
      Is the transaction safe?
      """
    And I am displayed the correct message in the modal
      """
      We take privacy and security very seriously. The information that you provide during the order process will be transferred to us through a private, secure connection.
      """
    And I am displayed the correct message in the modal
      """
      Did you forget your Social Security Number?
      """
    And I am displayed the correct message in the modal
      """
      Go to the official Social Security Administration website or call 1 800 772 1213 for more information on how to get a replacement card if your original one has been lost or stolen.
      """
    When I close the modal
    Then the modal is not visible
