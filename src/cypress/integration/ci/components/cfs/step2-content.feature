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
  #CP-373
  #Scenario: 1 - Privacy Security Image shall display on the Step 1 page
    Then The "main-header-section" element present on the page
    And The "main-header-section" image is displayed on the page
    And The "main-header-section" element shall not be hyperlinked
    And The "main-header-section" message contains "Privacy Security Protected"

    #CP-349 Continue Acknowledgement
    #todo need data-test
    And "[href="/cfs/tos"] on .tos-agreement" with text "Terms and Conditions" Hyperlinked to "/cfs/tos"
    And "[href="/cfs/tos"] on .tos-agreement" targets opening in a new tab
    And "[href="/cfs/privacy"] on .tos-agreement" with text "Privacy Policy" Hyperlinked to "/cfs/privacy"
    And "[href="/cfs/privacy"] on .tos-agreement" targets opening in a new tab
    And The ".tos-agreement" message contains "You understand by clicking on the "Continue" button below, you agree to the Terms and Conditions, acknowledge receipt of our Privacy Policy and agree to its terms, are providing "written instructions" to obtain your credit profile from any consumer reporting agency to display to you and to confirm your identity."

  Scenario: Step 2 Create Account page elements and form fields
    #CP-507 Create Account
    #todo need data-test
    #todo form fields with minimal BA needs validation tests
    When I click on the "[name=email]" field
    Then Check that the "[name=email]" field is focused
    And The "[name=email]" field label is "Your Username is (Email Address):"
    When I click on the "[name=password]" field
    Then Check that the "[name=password]" field is focused
    And The "[name=password]" field label is "Create your Password:"
    And The "<h5> within confirm-section" message contains "Create Username & Password"

    #CP-424 Required Fields Statement
    And The "<h5> within confirm-section" message contains "Verification Information - All Fields Required."
    And The "<p> within confirm-section" message contains "All information you provide is transmitted over a safe and secure connection."


  Scenario: Step 2 fields
    #CP-492
    When I click on the "[name=ssn1]" field
    Then Check that the "[name=ssn1]" field is focused
    When I click on the "[name=ssn2]" field
    Then Check that the "[name=ssn2]" field is focused
    When I click on the "[name=ssn4]" field
    Then Check that the "[name=ssn4]" field is focused
    And The "ssn" field label is "Social Security Number:"
    #CP-297 dob
    And I focus on the "[name=dobMonth]" field
    And I focus on the "[name=dobDay]" field
    And I focus on the "[name=dobYear]" field
    And The "dob" field label is "Date Of Birth:"
    #CP-472
    And I focus on the "cta-button" field
    And The "cta-button" message contains "Continue"
