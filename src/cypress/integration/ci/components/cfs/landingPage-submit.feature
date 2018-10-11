Feature: cfs/landingPage-submit.feature

  Test results of valid and invalid field entry

  Covers
  - CP-468 Desktop - CFS - Landing Page - Your Score Now CTA (API Dependency)


  Background:
    Given I am a user on the cfs flow
    Given I am on the cfs landing page
    Given the siteName is "NotCheckFreeScore"


  Scenario: Landing page fields empty
    When I click on the "firstName" field
    When I click on the "lastName" field
    When I click on the "email" field
    When I click on the "zip" field
    When I click on the "communicationPreferences" field
    And I click on the "cta-button" field
    Then I am guided to the cfs landing page
    And The "firstName" field border is outlined in red color
    And The "lastName" field border is outlined in red color
    And The "zip" field border is outlined in red color
    And The "email" field border is outlined in red color

  Scenario: Landing page fields valid and communications
    When I have enter valid "firstName" value "Samatha"
    When I have enter valid "lastName" value "Stone"
    When I have enter valid "email" value "SS@AP.com"
    When I have enter valid "zip" value "96768"
    When I click on the "communicationPreferences" field
    And I click on the "cta-button" field
    Then I am guided to the cfs step1 page

  Scenario: Landing page fields valid without communications
    When I have enter valid "firstName" value "Jim"
    When I have enter valid "lastName" value "Micchals"
    When I have enter valid "email" value "Jim.Micchals@mame.name.lame.com"
    When I have enter valid "zip" value "12341"
    And I click on the "cta-button" field
    Then Check that the "communicationPreferences" field is not checked
    Then I am guided to the cfs step1 page

  Scenario: Landing page firstName empty
    When without entering "firstName"
    When I have enter valid "lastName" value "Stone"
    When I have enter valid "email" value "SS@AP.com"
    When I have enter valid "zip" value "96768"
    And I click on the "cta-button" field
    Then I am guided to the cfs landing page
    And The "firstName" field border is outlined in red color
    And "firstName" value is ""
    And The "lastName" field border shall have a default border
    And "lastName" value is "Stone"
    And The "email" field border shall have a default border
    And "email" value is "SS@AP.com"
    And The "zip" field border shall have a default border
    And "zip" value is "96768"

  Scenario: Landing page lastName empty
    When I have enter valid "firstName" value "Samatha"
    When without entering "lastName"
    When I have enter valid "email" value "SS@AP.com"
    When I have enter valid "zip" value "96768"
    And I click on the "cta-button" field
    Then I am guided to the cfs landing page
    And The "firstName" field border shall have a default border
    And "firstName" value is "Samatha"
    And The "lastName" field border is outlined in red color
    And "lastName" value is ""
    And The "email" field border shall have a default border
    And "email" value is "SS@AP.com"
    And The "zip" field border shall have a default border
    And "zip" value is "96768"

  Scenario: Landing page firstName empty
    When I have enter valid "firstName" value "Samatha"
    When I have enter valid "lastName" value "Stone"
    When without entering "email"
    When I have enter valid "zip" value "96768"
    And I click on the "cta-button" field
    Then I am guided to the cfs landing page
    And The "firstName" field border shall have a default border
    And "firstName" value is "Samatha"
    And The "lastName" field border shall have a default border
    And "lastName" value is "Stone"
    And The "email" field border is outlined in red color
    And "email" value is ""
    And The "zip" field border shall have a default border
    And "zip" value is "96768"

  Scenario: Landing page firstName empty
    When I have enter valid "firstName" value "Samatha"
    When I have enter valid "lastName" value "Stone"
    When I have enter valid "email" value "SS@AP.com"
    When without entering "zip"
    And I click on the "cta-button" field
    Then I am guided to the cfs landing page
    And The "firstName" field border shall have a default border
    And "firstName" value is "Samatha"
    And The "lastName" field border shall have a default border
    And "lastName" value is "Stone"
    And The "email" field border shall have a default border
    And "email" value is "SS@AP.com"
    And The "zip" field border is outlined in red color
    And "zip" value is ""

  Scenario: Landing page invalid values entered
    When I have enter invalid "firstName" value "4ork" that "contains a number"
    When I have enter invalid "lastName" value "5tone" that "contains a number"
    When I have enter invalid "email" value "SS.AP.com" that "contains no @"
    When I have enter invalid "zip" value "9676B" that "contains a letter"
    And I click on the "cta-button" field
    Then Check that the "communicationPreferences" field is not checked
    Then I am guided to the cfs landing page
    And The "firstName" field border is outlined in red color
    And "firstName" value is "4ork"
    And The "lastName" field border is outlined in red color
    And "lastName" value is "5tone"
    And The "email" field border is outlined in red color
    And "email" value is "SS.AP.com"
    And The "zip" field border is outlined in red color
    And "zip" value is "9676"

  Scenario: Values entered on landing page are reflected on future steps
    When I have enter valid "firstName" value "emantsrif"
    When I have enter valid "lastName" value "emantsal"
    When I have enter valid "email" value "li@ame.tld"
    When I have enter valid "zip" value "54324"
    And I click on the "cta-button" field
    Then I am guided to the cfs step1 page
    And "firstName" value is "emantsrif"
    And "lastName" value is "emantsal"
    And "zip" value is "54324"
    When I have enter valid "street1" value "1 teerts"
    When I have enter valid "city" value "ytic"
    When I select "HI" on the "state" field
    And I click on the "cta-button" field
    And "email" value is "li@ame.tld"
