Feature: The Google

  I want to search for things

  Scenario: Opening a search engine
    Given I open Google page
    And take screenshot
    Then I see "Google" in the title


  Scenario: Multiple Scenarios per Feature
    Given I open Google page
    Then I see "Google" in the title

