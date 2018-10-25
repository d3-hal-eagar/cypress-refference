Feature: cfs/step3A-submit.feature

  Covers
    - CP-333 Desktop/Mobile - CFS - Step 4 Page - Authentication Page - Error Event Business Rules
    - CP-418 Desktop/Mobile - CFS - Step 4 Page - Submit Authentication Button

  Background:
    Given I am a user on the cfs flow
    Given the siteName is "NotCheckFreeScore"
    Given Register "Donald Blair"
    Given Mock KBA
    Given I am on the cfs step3A authentication page


  Scenario: Submit KBA First and Second page of One KBA round
    Then The "kba-heading within kba-form" message contains "Verification Questions"
    And The "kba-message within kba-form" message contains "You’re almost there! For the protection of your information, we just need to ask you a few questions to confirm your identity before proceeding."

    Given Mock KBA secondRound
    When I fill out kba questions and submit
    Then The "kba-heading within kba-form" message contains "Verification Questions"
    And The "kba-message within kba-form" message contains "Sorry, we were unable to verify your identity. For the protection of your information, we just need to ask you a few more questions to confirm your identity before proceeding."

  Scenario: Submit KBA Mock Pass To 3B
    #CP-418
    Given Mock KBA pass
    When I fill out kba questions and submit
    Then Wait for exists ".success-message-top"
    And The ".success-message-top in identity-confirmation-message" message contains "your identity has been confirmed and your score is ready!"
    Then The "cta-button" message contains "Take Me To My Score"
    And I click on the "cta-button" field
    Then I am guided to the cfs step4 view page

  Scenario: Submit KBA Mock Fail To Try Again
    Given Mock KBA fail
    When I fill out kba questions and submit
    Then The "<h3> within kba-form" message contains "We were unable to validate your identity."
    And The "kba-form" message contains "If you would like to try again, please do so now."
    And The "cta-button" message contains "Click to Try Again"



