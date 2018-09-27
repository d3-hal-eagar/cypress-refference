Feature: CFS Landing Page

  As a user when I am on the "cfs landing" page then I am displayed the following blocks

  Covers
  - CP-477 Desktop - CFS - Landing Page (Foundational UX/UI Story)
  - CP-460 Mobile - CFS - Landing Page (Foundational UX/UI)
  - CP-301 Desktop - CFS - Landing Page - Computer Magnify Image

  Background:
    Given I am a user on the cfs flow
    Given I am on the cfs landing page
    Given the siteName is "NotCheckFreeScore"


  Scenario: 1 - Footer Button Show my score
    And The "site-link" message contains siteName

  Scenario: 2 - Computer Magnify Image
    Then The "search-img" element present on the page
    And The "search-img" element shall not be hyperlinked
