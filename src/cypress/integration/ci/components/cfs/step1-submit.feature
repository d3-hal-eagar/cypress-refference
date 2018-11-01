Feature: cfs/step1-submit.feature

  Test results of valid and invalid field entry

  Covers
  - CP-281 Desktop/Mobile - CFS - Step 1 Page - Continue Button
  - CP-311 Desktop - CFS - Landing Page - Keyboard Navigation


  Background:
    Given I am a user on the cfs flow
    Given I am on the cfs step1 page
    Given the siteName is "NotCheckFreeScore"


  Scenario: step1 fields empty
    When I click on the "firstName" field
    When I click on the "lastName" field
    When I click on the "zip" field
    When I click on the "city" field
    When I click on the "street1" field
    When I focus on the "state" field
    And I click on the "cta-button" field
    Then I am guided to the cfs step1 page
    And The "firstName" field border is outlined in red color
    And The "lastName" field border is outlined in red color
    And The "zip" field border is outlined in red color
    And The "city" field border is outlined in red color
    And The "street1" field border is outlined in red color
    And The "state" field border is outlined in red color

  Scenario: step1 fields valid
    When I have enter valid "firstName" value "Juine"
    When I have enter valid "lastName" value "Ruby"
    When I have enter valid "zip" value "98989"
    When I have enter valid "city" value "Old York"
    When I have enter valid "street1" value "22 Streat lane"
    When I select "NY" on the "state" field
    And I click on the "cta-button" field
    Then I am guided to the cfs step2 page

  Scenario: step1 invalid values entered
    When I have enter invalid "firstName" value "$tork" that "contains a symbol"
    When I have enter invalid "lastName" value "$tone" that "contains a symbol"
    When I have enter invalid "zip" value "9676B" that "contains a letter"
    When I have enter invalid "city" value "New %ork" that "contains a symbol"
    When I have enter invalid "street1" value "22 Cortland $*" that "contains a symbol"
    And I click on the "cta-button" field
    Then I am guided to the cfs step1 page
    And The "firstName" field border is outlined in red color
    And "firstName" value is "$tork"
    And The "lastName" field border is outlined in red color
    And "lastName" value is "$tone"
    And The "zip" field border is outlined in red color
    And "zip" value is "9676"
    And The "city" field border is outlined in red color
    And "city" value is "New %ork"
    And The "street1" field border is outlined in red color
    And "street1" value is "22 Cortland $*"

  #CP-311
  Scenario: 1 Landing Page Default Keyboard Navigation
    When I click on the "firstName" field
    #enter with all invalid
    When I enter additional text into "lastName" field text "boo!u{enter}"
    When I wait "500"
    Then I am guided to the cfs step1 page
    And The "firstName" field border is outlined in red color
    And The "lastName" field border is outlined in red color
    And The "zip" field border is outlined in red color
    And The "city" field border is outlined in red color
    And The "street1" field border is outlined in red color
    And The "state" field border is outlined in red color
    #first invalid is firstname
    Then Check that the "firstName" field is focused
    When I have enter valid "firstName" value "BodaciousT"
    When I enter additional text into "street1" field text "{enter}"
    When I wait "500"
    Then I am guided to the cfs step1 page
    Then The "firstName" field border shall have a default border
    #first invalid is lastName
    Then Check that the "lastName" field is focused
    And The "lastName" field border is outlined in red color
    And The "zip" field border is outlined in red color
    And The "city" field border is outlined in red color
    And The "street1" field border is outlined in red color
    And The "state" field border is outlined in red color
    #enter all valid
    When I have enter valid "firstName" value "Juine"
    When I have enter valid "lastName" value "Ruby"
    When I have enter valid "zip" value "98989"
    When I have enter valid "city" value "Old York"
    When I have enter valid "street1" value "22 Street lane"
    When I select "NY" on the "state" field
    When I enter additional text into "street1" field text "{enter}"
    Then I am guided to the cfs step2 page
