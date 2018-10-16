Feature: cfs/step4-content.feature

  Covers
    - CP-315 Desktop - CFS - Step 4 Page - Authentication Page (Foundational UX/UI)
    - CP-320 Mobile - CFS - Step 4 - Authentication Page (Foundational UX/UI)
    - CP-333 Desktop/Mobile - CFS - Step 4 Page - Authentication Page - Error Event Business Rules
    - CP-418 Desktop/Mobile - CFS - Step 4 Page - Submit Authentication Button

  Background:
    Given I am a user on the cfs flow
    Given I am on the cfs step4 authentication page
    Given the siteName is "NotCheckFreeScore"

  #CP-315 CP-320
  Scenario: KBA content validation
    #text at top of form
    Then The "<h5> within kba-questions" message contains "Verification Questions"
    And The "<p> within kba-questions" message contains "You’re almost there! For the protection of your information, we just need to ask you a few questions to confirm your identity before proceeding."
    #the submit button
    And I focus on the "cta-button" field
    And The "cta-button" message contains "Submit Authentication"

  #CP-418
  Scenario: Submit Authentication
    When I correctly fill out kba questions
    And I click element "cta-button"
    Then I am guided to the cfs step4 view page

  #CP-333
  Scenario: 1 Incomplete KBA
    Then Action detail "I do not select an answer for all presented KBA inquiries"
    When I click element "cta-button"
    Then I am displayed the correct message on "error within kba-questions"
      """
      error(s) prohibited this from being submitted.
      """
    And I am displayed the correct message on "error within kba-questions"
      """
      There were problems with the following fields:
      """
    And I am displayed the correct message on "error within kba-questions"
      """
      Please answer all of the questions.
      """

  Scenario: 2,3,4 The user shall have four chances to respond correctly to KBA
    #first try
    When I incorrectly fill out kba questions
    When I click element "cta-button"

    #second retry
    Then The "<h5> within kba-questions" message contains "Verification Questions"
    And The "<p> within kba-questions" message contains "Sorry, we were unable to verify your identity. For the protection of your information, we just need to ask you a few more questions to confirm your identity before proceeding."
    When I incorrectly fill out kba questions
    When I click element "cta-button"
    #I get a different page
    Then The "<h1> within kba-questions" message contains "We were unable to validate your identity."
    And The "<p> within kba-questions" message contains "If you would like to try again, please do so now."
    And I focus on the "cta-button" field
    And The "cta-button" message contains "Click to Try Again"
    When I click element "cta-button"

    #third retry
    Then The "<h5> within kba-questions" message contains "Verification Questions"
    And The "<p> within kba-questions" message contains "Sorry, we were unable to verify your identity. For the protection of your information, we just need to ask you a few more questions to confirm your identity before proceeding."
    When I incorrectly fill out kba questions
    When I click element "cta-button"
    Then The "<h1> within kba-questions" message contains "We were unable to validate your identity."
    And The "<p> within kba-questions" message contains "If you would like to try again, please do so now."
    And I focus on the "cta-button" field
    And The "cta-button" message contains "Click to Try Again"
    When I click element "cta-button"

    #forth retry
    Then The "<h5> within kba-questions" message contains "Verification Questions"
    And The "<p> within kba-questions" message contains "Sorry, we were unable to verify your identity. For the protection of your information, we just need to ask you a few more questions to confirm your identity before proceeding."
    When I incorrectly fill out kba questions
    When I click element "cta-button"
    Then The "<h1> within kba-questions" message contains "We were unable to validate your identity."
    And The "<p> within kba-questions" message contains "If you would like to try again, please do so now."
    And I focus on the "cta-button" field
    And The "cta-button" message contains "Click to Try Again"
    When I click element "cta-button"

    Then Action detail "I failed KBAs 4 times failed message"
    #I am so rejected
    #I get another different page
    Then The "<h1>" message contains "We are sorry, but we are unable to help you at this time."
