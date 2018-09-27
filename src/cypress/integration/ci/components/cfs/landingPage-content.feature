Feature: cfs/landingPage-content.feature

  As a user when I am on the "cfs landing" page then I am displayed the following blocks

  Covers
  - CP-477 Desktop - CFS - Landing Page (Foundational UX/UI Story)
  - CP-460Mobile - CFS - Landing Page (Foundational UX/UI)

  Background:
    Given I am a user on the cfs flow
    Given I am on the cfs landing page
    Given the siteName is "NotCheckFreeScore"


  Scenario: Footer Button Show my score
    And The "site-link" message contains siteName


