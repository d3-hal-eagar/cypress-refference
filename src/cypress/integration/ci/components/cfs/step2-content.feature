Feature: cfs/step2-content.feature

  Covers
    - CP-364 Desktop - CFS - Step 2 Page - Confirm Page (Foundational UX/UI)
    - CP-416 Mobile - CFS - Step 2 Page - Confirm Page (Foundational UX/UI Story)
    - CP-373 - Desktop/Mobile - CFS - Privacy Security Image
    - CP-424 Desktop/Mobile - CFS - Step 2 Page - Required Fields Statement (copy requirement)
    - CP-349 Desktop/Mobile - CFS - Step 2 Page - Continue Acknowledgement (copy requirement)
    - CP-507 Desktop/Mobile - CFS - Step 2 Page - Create Account

  Background:
    Given I am a user on the cfs flow
    Given I am on the cfs step2 page
    Given the siteName is "NotCheckFreeScore"


  Scenario: Step 2 page elements
    #CP-373 removed per CP-2474
    Then The "main-header-section" element is not present on the page

    #CP-349 Continue Acknowledgement
    And "tos-link on terms" with text "Terms and Conditions" Hyperlinked to "/cfs/tos"
    And "tos-link on terms" targets opening in a new tab
    And "privacy-link on terms" with text "Privacy Policy" Hyperlinked to "/cfs/privacy"
    And "privacy-link on terms" targets opening in a new tab
    And The "terms" message contains "You understand by clicking on the "Continue" button below, you agree to the Terms and Conditions, acknowledge receipt of our Privacy Policy and agree to its terms, are providing "written instructions" to obtain your credit profile from any consumer reporting agency to display to you and to confirm your identity."

  Scenario: Step 2 Create Account page elements and form fields
    #CP-507 Create Account
    #todo form fields with minimal BA needs validation tests
    When I click on the "email" field
    Then Check that the "email" field is focused
    And The "email" field label is "Your Username is (Email Address):"
    When I click on the "password" field
    Then Check that the "password" field is focused
    And The "password" field label is "Create your Password:"
    And The "<h5> within confirm-section" message contains "Create Username & Password"

    #CP-424 Required Fields Statement
    And The "<h5> within confirm-section" message contains "Verification Information - All Fields Required."
    And The "<p> within confirm-section" message contains "All information you provide is transmitted over a safe and secure connection."

  Scenario: Step 2 fields
    #CP-492
    When I click on the "ssn1" field
    Then Check that the "ssn1" field is focused
    When I click on the "ssn2" field
    Then Check that the "ssn2" field is focused
    When I click on the "ssn4" field
    Then Check that the "ssn4" field is focused
    And The "ssn" field label is "Social Security Number:"
    #CP-297 dob
    And I focus on the "dobMonth" field
    And I focus on the "dobDay" field
    And I focus on the "dobYear" field
    And The "dob" field label is "Date Of Birth:"
    #CP-472
    And I focus on the "cta-button" field
    And The "cta-button" message contains "Continue"

  Scenario: Step 2 validation area
    When I click on the "cta-button" field
    And The ".error-header within error-container" message contains "error(s) prohibited this from being submitted."
    And The ".error-body within error-container" message contains "There were problems with the following fields:"
