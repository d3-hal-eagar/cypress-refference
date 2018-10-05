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
  #CP-373
  #Scenario: 1 - Privacy Security Image shall display on the Step 1 page
    Then The "main-header-section" element present on the page
    And The "main-header-section" image is displayed on the page
    And The "main-header-section" element shall not be hyperlinked
    And The "main-header-section" message contains "Privacy Security Protected"
  #CP-520
  #Scenario: 2 - Please Provide Entreaty Placement
    And The "<h5> within complete-section" message contains "Please provide your address to locate your credit file"
    And The "<p> within complete-section" message contains "Please take the time to set up your account."

  Scenario: Step 1 fields
    #CP-310
    When I click on the "firstName" field
    Then Check that the "firstName" field is focused
    And The "firstName" field label is "First Name:"
    #CP-402
    When I click on the "lastName" field
    Then Check that the "lastName" field is focused
    And The "lastName" field label is "Last Name:"
    #CP-369
    When I click on the "street1" field
    Then Check that the "street1" field is focused
    And The "street1" field label is "Address:"
    #CP-347
#    When I click on the "city" field
#    Then Check that the "city" field is focused
#    And The "city" field label is "City:"
    #CP-291
    When I focus on the "state" field
    And The "state" field label is "State:"
    #CP-465
    When I click on the "zip" field
    Then Check that the "zip" field is focused
    And The "zip" field label is "Zip code:"
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
