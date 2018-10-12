Feature: cfs/step3-content.feature

  After passing KBA I am told I pass before going to final view

  Covers
    - CP-521 Desktop/Mobile - CFS - Step 3 Page - Identity Confirmation (copy requirement)
    - CP-482 Desktop/Mobile - CFS - Step 3 Page - Take Me To My Score Button (TU API Dependency)

  Background:
    Given I am a user on the cfs flow
    Given I am on the cfs step3 page
    Given the siteName is "NotCheckFreeScore"


  Scenario: 1 - identity-confirmation with firstname lastname and cta button
    #CP-521
    #todo fill in this localstore data without needing to fill the form
    Given I am on the cfs step1 page
    When I have enter valid "firstName" value "FirstNamePlaceholder"
    When I have enter valid "lastName" value "LastNamePlaceholder"
    When I have enter valid "zip" value "98989"
    When I have enter valid "city" value "Old York"
    When I have enter valid "street1" value "22 Streat lane"
    When I select "NY" on the "state" field
    And I click on the "cta-button" field

    Given I am on the ck step3 confirm page
    And The "identity-confirmation-message" message contains "FirstNamePlaceholder"
    And The "identity-confirmation-message" message contains "LastNamePlaceholder"
    And The "identity-confirmation-message" message contains ", your identity has been confirmed and your score is ready!"
    And The "identity-confirmation-message" message contains "TransUnion Credit Score"
    And The "identity-confirmation-message" message contains "Pulling Your Accounts on File"
    And The "identity-confirmation-message" message contains "Processed"
    And The "identity-confirmation-message" message contains "Processed"


    #CP-482
    And I focus on the "cta-button" field
    Then The "cta-button" message contains "Take Me To My Score"
    And I click on the "cta-button" field
    Then I am guided to the cfs step4 view page
