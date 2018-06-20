Feature: The Bing

  I want to search for things

  Scenario: Opening a search engine (this inentionaly fails)
    Given I open Google page
    Then take screenshot named "bing-page"
    Then I see "Bing" in the title

