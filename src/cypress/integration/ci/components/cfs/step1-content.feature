Feature: cfs/step1-content.feature

  Covers
    - CP-382 Desktop - CFS - Step 1 Page (Foundational UX/UI)
    - CP-452 Mobile - CFS - Step 1 Page (Foundational UX/UI)
    - CP-373 - Desktop/Mobile - CFS - Privacy Security Image
    - CP-520 - Desktop/Mobile - CFS - Step 1 Page - Please Provide Entreaty (copy requirement)

  Background:
    Given I am a user on the cfs flow
    Given I am on the cfs step1 page
    Given the siteName is "NotCheckFreeScore"


  Scenario: Step 1 page elements
  #CP-373 removed per CP-2474
    Then The "main-header-section" element is not present on the page
  #CP-520
  #Scenario: 2 - Please Provide Entreaty Placement
    And The "<h5> within complete-section" message contains "Please provide your name and address so we can locate your credit file"

  Scenario: Step 1 fields
    #CP-310
    And The "firstName" field label is "First Name:"
    And The "firstName" field label is default color
    When I click on the "firstName" field
    Then Check that the "firstName" field is focused
    When I have enter valid "firstName" value "Juine"
    And The "firstName" field label is filled color
    #CP-402
    And The "lastName" field label is "Last Name:"
    And The "lastName" field label is default color
    When I click on the "lastName" field
    Then Check that the "lastName" field is focused
    When I have enter valid "lastName" value "Ruby"
    And The "lastName" field label is filled color

    #CP-369
    And The "street1" field label is "Address:"
    And The "street1" field label is default color
    When I have enter valid "street1" value "22 Streat lane"
    When I click on the "street1" field
    Then Check that the "street1" field is focused
    And The "street1" field label is filled color
    #CP-347
    And The "city" field label is "City:"
    And The "city" field label is default color
    When I click on the "city" field
    Then Check that the "city" field is focused
    When I have enter valid "city" value "Old York"
    And The "city" field label is filled color
    #CP-291
    And The "state" field label is "State:"
    And The "state" field label is default color
    When I focus on the "state" field
    When I select "NY" on the "state" field
    And The "state" field label is filled color
    #CP-465
    And The "zip" field label is "Zip code:"
    And The "zip" field label is default color
    When I click on the "zip" field
    Then Check that the "zip" field is focused
    When I have enter valid "zip" value "98989"
    And The "zip" field label is filled color
    #CP-441 Survey Questions
    #tricky the questions vary but they all contain 'score'
    And The "survey" message contains "score"
    And The "<label> containing survey-yes" message contains "Yes"
    And The "<label> containing survey-no" message contains "No"
    When I click on the "survey-yes" field
    Then Check that the "survey-yes" field is focused
    When I click on the "survey-no" field
    Then Check that the "survey-no" field is focused

    #CP-281
    And I focus on the "cta-button" field
    And The "cta-button" message contains "Continue"

  Scenario: Step 1 validation area
    When I click on the "cta-button" field
    And The ".error-header within error-container" message contains "6 error(s) prohibited this from being submitted."
    And The ".error-body within error-container" message contains "There were problems with the following fields:"
