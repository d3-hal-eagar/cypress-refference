Feature: cfs/step3B-content.feature

  After passing KBA I am told I pass before going to final view

  Covers
    - CP-418 Desktop/Mobile - CFS - Step 4 Page - Submit Authentication Button
    - CP-521 Desktop/Mobile - CFS - Step 3 Page - Identity Confirmation (copy requirement)
    - CP-482 Desktop/Mobile - CFS - Step 3 Page - Take Me To My Score Button (TU API Dependency)
    - CP-360 Desktop/Mobile - CFS - KBA Processing Event Notifications

  Background:
    Given I am a user on the cfs flow
    Given the siteName is "NotCheckFreeScore"
    Given Register "Donald Blair"

  Scenario: 1 - identity-confirmation with firstname lastname and cta button
    Given Mock KBA
    Given I am on the cfs step3A authentication page
    #CP-360 first loading message
    Then The "modal-body" message contains "Loading questions, please wait..."
    Then Wait for not exists ".loading-modal"

  #CP-418
  #Scenario: Submit Valid KBA
    Given Mock KBA pass
    When I fill out kba questions and stop
    When I click on the "cta-button" field
    #CP-360 second loading message
    Then The "modal-body" message contains "Processing questions, please wait..."
    Then Wait for not exists ".loading-modal"
    Then I am guided to the cfs step3A authentication page

    #CP-521
    And The ".success-message-top in identity-confirmation-message" message contains "Donald"
    And The ".success-message-top in identity-confirmation-message" message contains "Blair"
    And The ".success-message-top in identity-confirmation-message" message contains "your identity has been confirmed and your score is ready!"
    And The ".success-message-bottom in identity-confirmation-message" message contains "TransUnion Credit Score"
    And The ".success-message-bottom in identity-confirmation-message" message contains "Pulling Your Accounts on File"
    And The ".success-message-bottom in identity-confirmation-message" message contains "Processed"
    And The ".success-message-bottom in identity-confirmation-message" message contains "Processed"

    #CP-482
    And I focus on the "cta-button" field
    Then The "cta-button" message contains "Take Me To My Score"
