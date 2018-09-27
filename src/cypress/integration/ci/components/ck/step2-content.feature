Feature: ck/step2-content.feature

  As a user when I am on Step 2 of acquisition flow then I am displayed the form fields

  covers
  - D3F-37 As a user when I am on Step 2 of acquisition flow then I am displayed the form fields
  - D3F-338 Mobile - As a user when I am on Step 2 of acquisition flow then I am displayed the form fields
  - D3F-218 As a user when I am on Step 2 of acquisition path, I am displayed blocks of information on the right rail


  Background: user on Step 2 acquisition flow screen
    Given I am a user on the ck flow
    Given I am on the ck step2 form page
    Given the siteName is "NotCreditKarma"


  Scenario: 1 - test existence of form fields
    When I click on the "firstName" field
    Then Check that the "firstName" field is focused
    And The "firstName" field label is "First Name"
    When I click on the "lastName" field
    Then Check that the "lastName" field is focused
    And The "lastName" field label is "Last Name"
    When I click on the "street1" field
    Then Check that the "street1" field is focused
    And The "street1" field label is "Street Address"
    When I click on the "street2" field
    Then Check that the "street2" field is focused
    And The "street2" field label is "Apartment"
    When I click on the "ssn" field
    Then Check that the "ssn" field is focused
    And The "ssn" field label is "Last 4 Digits of your Social Security Number"
    When I click on the "city" field
    Then Check that the "city" field is focused
    And The "city" field label is "City"
    When I click on the "zip" field
    Then Check that the "zip" field is focused
    And The "zip" field label is "Zip Code"
    When I focus on the "state" field
    Then The "state" field label is "State"
    When I focus on the "dobMonth" field
    Then I focus on the "dobDay" field
    And I focus on the "dobYear" field
    And The "dob" field label is "Date of Birth"
    When I focus on the "agreement" field
    And I focus on the "next-step-button" field
    Then Action detail "all fields were present"

  Scenario: 2 - test for terms and account created section and site name token
    Then The page header is "You're on your way to free credit scores."
    And The "terms" message contains "By clicking on "Next Step", you agree to"
    And The "terms" message contains "Terms Of Service, including our Privacy Policy"
    And The "terms" message contains siteName
    And The "account-created-section" message contains "Account Created! Your account is now created for the following email address: "

  Scenario: 3 - agreement text and site name token
    Then The "agreement-text" message contains siteName
    And The "agreement-text" message contains "I understand that I am providing written instructions in accordance with the Fair Credit Reporting Act and other applicable law for "
    And The "agreement-text" message contains "or its affiliated companies to request and receive copies of consumer reports, scores and related information about me from third parties, including, but not limited to, TransUnion. I understand that my instructions let"
    And The "agreement-text" message contains "and affiliated companies obtain such information at any time for as long as I have a registered"
    And The "agreement-text" message contains "account to use as described in the Terms of Service and Privacy Policy."

    #D3F-218
  Scenario: As a user when I am on Step 2 of acquisition path, I am displayed blocks of information on the right rail
    Then I am displayed the correct blocks on the ck Step 2 right rail
