Feature: Ex Landing Page

  As a user when I am on the "ex lp" page then I am displayed the following blocks

  Covers
  - CP-765 Build Experian Landing Page
  - CP-832 Mobile - Build Experian Landing Page


  Background:
    Given I am a user on the ex flow
    Given I am on the ex landing page

  Scenario: Block 1 "Free Credit Report"
    Then I am displayed the following on the 'Free Credit Report' block

  Scenario: Block 2 Hero Image
    Then I am displayed the 'Hero Image' block

  Scenario: Block 3 "Why get your free Credit Report" section
    Then I am displayed the following on the 'Why get your free Credit Report' block

  #TODO: add tests for images
  Scenario: Block 4 "Credit Report resources" section
    Then I am displayed the following on the 'Credit Report resources' block

  Scenario: Block 5 "Credit Report basics" section
    Then I am displayed the following on the 'Credit Report basics' block

  Scenario: Block 6 "landing footer" section
    Then I am displayed the following on the 'landing footer' block

  Scenario: Toggling Read More on Article 1
    When I click element "read0-link"
    Then I should see full Article 1 and link to Read Less
    When I click element "read0-link"
    Then I should see shortened Article 1 and link to Read More

  Scenario: Toggling Read More on Article 2
    When I click element "read1-link"
    Then I should see full Article 2 and link to Read Less
    When I click element "read1-link"
    Then I should see shortened Article 2 and link to Read More

  Scenario: Toggling Read More on Article 3
    When I click element "read2-link"
    Then I should see full Article 3 and link to Read Less
    When I click element "read2-link"
    Then I should see shortened Article 3 and link to Read More

  Scenario: Header Button
    When I click element "header-signup-button"
    Then I am on the ex step1 signup page

  Scenario: Cta Button
    When I click element "report-signup-button"
    Then I am on the ex step1 signup page

  Scenario: Footer Button
    When I click element "footer-signup-button"
    Then I am on the ex step1 signup page

