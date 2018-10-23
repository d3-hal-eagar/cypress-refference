Feature: cfs/step3B-content.feature

  After passing KBA I am told I pass before going to final view

  Covers
    - CP-418 Desktop/Mobile - CFS - Step 4 Page - Submit Authentication Button
    - CP-521 Desktop/Mobile - CFS - Step 3 Page - Identity Confirmation (copy requirement)
    - CP-482 Desktop/Mobile - CFS - Step 3 Page - Take Me To My Score Button (TU API Dependency)

  Background:
    Given I am a user on the cfs flow
    Given the siteName is "NotCheckFreeScore"
#    Given I am on the cfs step1 page
#    When I have enter valid "firstName" value "Donald"
#    When I have enter valid "lastName" value "Blair"
#    When I have enter valid "zip" value "78228"
#    When I have enter valid "city" value "SAN ANTONIO"
#    When I have enter valid "street1" value "3627 W Poplar St"
#    When I select "TX" on the "state" field
#    And I click on the "cta-button" field
#
#    And I have enter valid "ssn1" value "666"
#    And I have enter valid "ssn2" value "28"
#    And I have enter valid "ssn4" value "5344"
#    When I select "11" on the "dobMonth" field
#    And I select "20" on the "dobDay" field
#    And I select "1939" on the "dobYear" field
#    When I have enter unique "email" value "tester@credmo.com"
#    When I have enter valid "password" value "1securePassword$"
#    And I click element "cta-button"
#    Then The "modal-body" message contains " Loading questions, please wait..."
#    Then I am guided to the cfs step3A authentication page

    Given Register "Donald Blair"
    Given Mock KBA
    Then Wait for not exists ".loading-modal"
    Given I am on the cfs step3A authentication page


  Scenario: 1 - identity-confirmation with firstname lastname and cta button
  #CP-418
  #Scenario: Submit Valid KBA
    Given Mock KBA pass
    When I correctly fill out kba questions
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
