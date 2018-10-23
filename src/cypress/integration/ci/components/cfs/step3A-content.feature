Feature: cfs/step3A-content.feature

  Covers
    - CP-315 Desktop - CFS - Step 4 Page - Authentication Page (Foundational UX/UI)
    - CP-320 Mobile - CFS - Step 4 - Authentication Page (Foundational UX/UI)
    - CP-333 Desktop/Mobile - CFS - Step 4 Page - Authentication Page - Error Event Business Rules
    - CP-418 Desktop/Mobile - CFS - Step 4 Page - Submit Authentication Button
    - CP-373 - Desktop/Mobile - CFS - Privacy Security Image

  Background:
    Given I am a user on the cfs flow
    Given Mock KBA
    Given I am on the cfs step3A authentication page
    Given the siteName is "NotCheckFreeScore"


  Scenario: Submit Invalid UserData (no kba)
    Given I am on the cfs step3A authentication page
    Then The "failed-kba" message contains "We are sorry, but we are unable to help you at this time."

  #CP-373
  Scenario: 1 - Privacy Security Image shall display on the Step 3A page
    Then The "main-header-section" element present on the page
    And The "main-header-section" image is displayed on the page
    And The "main-header-section" element shall not be hyperlinked
    And The "main-header-section" message contains "Privacy Security Protected"

  #CP-315 CP-320
  Scenario: KBA content validation
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
          #Then The "modal-body" message contains "Loading questions, please wait..."
          Then Wait for not exists ".loading-modal"
          Then I am guided to the cfs step3A authentication page


    #text at top of form
    Then The "kba-heading within kba-form" message contains "Verification Questions"
    And The "kba-message within kba-form" message contains "You’re almost there! For the protection of your information, we just need to ask you a few questions to confirm your identity before proceeding."
    #the submit button
    And I focus on the "cta-button" field
    And The "cta-button" message contains "Submit Authentication"

  #CP-333
  Scenario: 1 Incomplete KBA
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
          #Then The "modal-body" message contains "Loading questions, please wait..."
          Then Wait for not exists ".loading-modal"
          Then I am guided to the cfs step3A authentication page

    Then Action detail "I do not select an answer for all presented KBA inquiries"
    When I click element "cta-button"
    And The ".error-header within error-container" message contains "error(s) prohibited this from being submitted."
    And The ".error-body within error-container" message contains "There were problems with the following fields:"
    Then I shall be displayed an error for the "kba-form" field - "Please answer all of the questions." in red


