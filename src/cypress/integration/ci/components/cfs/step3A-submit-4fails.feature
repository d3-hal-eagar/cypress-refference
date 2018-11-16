Feature: cfs/step3A-submit-4fails.feature

  Covers
    - CP-333 Desktop/Mobile - CFS - Step 4 Page - Authentication Page - Error Event Business Rules

  Background:
    #todo make this happen without interacting with all pages
    Given I am a user on the cfs flow
    Given the siteName is "NotCheckFreeScore"
    Given I am on the cfs step1 page
    When I have enter valid "firstName" value "Donald"
    When I have enter valid "lastName" value "Blair"
    When I have enter valid "zip" value "78228"
    When I have enter valid "city" value "SAN ANTONIO"
    When I have enter valid "street1" value "3627 W Poplar St"
    When I select "TX" on the "state" field
    And I click on the "cta-button" field

    And I have enter valid "ssn1" value "666"
    And I have enter valid "ssn2" value "28"
    And I have enter valid "ssn4" value "5344"
    When I select "11" on the "dobMonth" field
    And I select "20" on the "dobDay" field
    And I select "1939" on the "dobYear" field
    When I have enter unique "email" value "tester@credmo.com"
    When I have enter valid "password" value "1securePassword$"
    And I click element "cta-button"
    Then Wait for not exists ".loading-modal"
    Then I am guided to the cfs step3A authentication page
    Then Wait for not exists ".loading-modal"

  #CP-333
  Scenario: 2,3,4 The user shall have four chances to respond correctly to KBA

    Then Action detail "first try 3 questions then 2"
      Then The "kba-heading within kba-form" message contains "Verification Questions"
      And The "kba-message within kba-form" message contains "You’re almost there! For the protection of your information, we just need to ask you a few questions to confirm your identity before proceeding."
    When I fill out kba questions and submit
      Then The "kba-heading within kba-form" message contains "Verification Questions"
      And The "kba-message within kba-form" message contains "Sorry, we were unable to verify your identity. For the protection of your information, we just need to ask you a few more questions to confirm your identity before proceeding."
    When I fill out kba questions and submit
    When I fill out kba questions and submit


    Then Action detail "first retry offer"
      Then The "<h4> within kba-form" message contains "We were unable to validate your identity."
      And The "kba-form" message contains "If you would like to try again, please do so now."
      And The "cta-button" message contains "Click to Try Again"
      When I click element "cta-button"
      Then Wait for not exists ".loading-modal"

    Then Action detail "Second try 3 questions then 2"
      When I fill out kba questions and submit
      When I fill out kba questions and submit
      When I fill out kba questions and submit

    Then Action detail "second retry offer"
#      Then The "<h4> within kba-form" message contains "We were unable to validate your identity."
#      And The "kba-message within kba-form" message contains "If you would like to try again, please do so now."
      And The "cta-button" message contains "Click to Try Again"
      When I click element "cta-button"
      Then Wait for not exists ".loading-modal"

    Then Action detail "Third try 3 questions then 2"
      When I fill out kba questions and submit
      When I fill out kba questions and submit
      When I fill out kba questions and submit


    Then Action detail "Third retry offer"
#      Then The "<h4> within kba-form" message contains "We were unable to validate your identity."
#      And The "kba-message within kba-form" message contains "If you would like to try again, please do so now."
      And The "cta-button" message contains "Click to Try Again"
      When I click element "cta-button"
      Then Wait for not exists ".loading-modal"

    Then Action detail "forth try 3 questions then 2"
      When I fill out kba questions and submit
      When I fill out kba questions and submit
      When I fill out kba questions and submit

    Then Action detail "I failed KBAs 4 times failed message"
      #Then The "failed-kba" message contains "We are sorry, but we are unable to help you at this time."
      Then I am guided to PORTAL_KBA_EXIT
