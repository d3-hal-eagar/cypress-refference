Feature: cfs/step1-submit.feature

  Test results of valid and invalid field entry

  Covers
  - CP-281 Desktop/Mobile - CFS - Step 1 Page - Continue Button


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
    When I have enter invalid "firstName" value "4ork" that "contains a number"
    When I have enter invalid "lastName" value "5tone" that "contains a number"
    When I have enter invalid "zip" value "9676B" that "contains a letter"
    When I have enter valid "city" value "New 4ork"
    When I have enter valid "street1" value "22 Cortland $*"
    And I click on the "cta-button" field
    Then I am guided to the cfs step1 page
    And The "firstName" field border is outlined in red color
    And "firstName" value is "4ork"
    And The "lastName" field border is outlined in red color
    And "lastName" value is "5tone"
    And The "zip" field border is outlined in red color
    And "zip" value is "9676"
    And The "city" field border is outlined in red color
    And "city" value is "New 4ork"
    And The "street1" field border is outlined in red color
    And "street1" value is "22 Cortland $*"


