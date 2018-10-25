Feature: cfs/step4-content.feature

  I view my Credit Report

  Covers
    - CP-335 Desktop - CFS - Step 4 Page - View Page (Foundational UX/UI)
    - CP-436 Mobile - CFS - Step 4 Page - View Page (Foundational UX/UI)

  Background:
    Given I am a user on the cfs flow
    Given the siteName is "NotCheckFreeScore"


  Scenario: Credit Report mock
    Given Register "Donald Blair"
    Given Mock KBA
    Given I am on the cfs step3A authentication page
    Then Wait for not exists ".loading-modal"
    Given Mock KBA pass
    When I fill out kba questions and submit
    #made it to step 3B
    Given Mock Report for "Donald Blair"
    Then The "cta-button" message contains "Take Me To My Score"
    And I click on the "cta-button" field

    Then I am guided to the cfs step4 view page
    Then The ".loading-modal-content" message contains "Loading your credit report, please wait..."
#    Then Wait for not exists ".loading-modal"
#    Then Wait for exists ".header-content .header-image"
#    Then The ".header-content h2" message contains "My Credit Reports"
#    Then Wait for exists "fake-report"





  Scenario: Credit Report real
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
    When I fill out kba questions correct answers and submit
    When I fill out kba questions correct answers and submit
    #made it to step 3B
    Then The "cta-button" message contains "Take Me To My Score"
    And I click on the "cta-button" field

    Then I am guided to the cfs step4 view page
    Then The ".loading-modal-content" message contains "Loading your credit report, please wait..."
    Then Wait for not exists ".loading-modal"
    Then Wait for exists ".header-content .header-image"
    Then The ".header-content h2" message contains "My Credit Reports"
    Then The ".container .row h3" message contains "Credit Report Date"
    Then Wait for exists ".score.scoreVal"

