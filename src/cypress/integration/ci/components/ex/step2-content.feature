  Feature: Step2 info fields

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


  Scenario: 1 - test existence of form fields
    When I click on the "username" field
    Then Check that the "username" field is focused
    And The "username" field label is "Username"
    When I click on the "password" field
    Then Check that the "password" field is focused
    And The "password" field label is "Password"
    When I click on the "cofirmPassword" field
    Then Check that the "cofirmPassword" field is focused
    And The "cofirmPassword" field label is "Confirm Password"
    When I click on the "ssn" field
    Then Check that the "ssn" field is focused
    And The "ssn" field label is "Last 4 Digits of your Social Security Number"
    And I focus on the "ssn-display-checkbox" field
    And "ssn-display-checkbox" parent div contains "Display"
    And The "modal-link" message contains "Why do we need this?"

    And I focus on the "dobMonth" field
    And I focus on the "dobDay" field
    And I focus on the "dobYear" field
    And The "dob" field label is "Date Of Birth"
    And I focus on the "next-step-button" field
    Then Action detail "all fields were present"

  Scenario: 2 - test existence of messages and site name token
    #Then The page header is "Create Your Account"
    Then The "account-section containing title" message contains "Create Your Account"
    And The a subheader exists "Identity Verification"
    And The a subheader exists "Account Information"
    And The "terms" message contains "By clicking \"Submit Secure Order\": I accept and agree to your Terms of Use Agreement, as well as acknowledge receipt of your Privacy Policy."
    And The "terms" message contains "I authorize"
    And The "terms" message contains "to obtain my credit report and/or credit score(s), on a recurring basis to:"
    And The "terms" message contains "Provide my credit report (and/or credit score) to me for review while I have an account with "
    And The "terms" message contains "Notify me of other products and services that may be available to me through "
    And The "terms" message contains "or through unaffiliated third parties."
    And The "terms" message contains "Notify me of credit opportunities and advertised credit offers."
    And The "terms" message contains "I understand that I may withdraw this authorization at any time by contacting"
    And The "terms" message contains siteName

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
