Feature: cfs/landingPage-content.feature

  As a user when I am on the "cfs landing" page then I am displayed the following blocks

  Covers
  - CP-477 Desktop - CFS - Landing Page (Foundational UX/UI Story)
  - CP-460 Mobile - CFS - Landing Page (Foundational UX/UI)
  - CP-301 Desktop - CFS - Landing Page - Computer Magnify Image
  - CP-394 Desktop - CFS - Landing Page - Left Side Image
  - CP-345 Desktop - CFS - Landing Page - Right Rail Benefits Tout
  - CP-451 Desktop - CFS - Landing Page - Bottom Left Side Image
  - CP-357 Desktop - CFS - Landing Page: Bottom Right Side Image
  - CP-329 Desktop - CFS - Landing Page - Page Header (Copy Requirement)
  - CP-323 Desktop - CFS - Landing Page - Start Here Arrow
  - CP-471 Desktop - CFS - Landing Page - Start Here Prompt (Copy Requirement)
  - CP-516 Desktop - CFS - Landing Page - Why Check Blurb (copy requirement)
  - CP-467 Desktop - CFS - Landing Page - No Harm Declaration (copy requirement)

  Background:
    Given I am a user on the cfs flow
    Given I am on the cfs landing page
    Given the siteName is "NotCheckFreeScore"


  Scenario: Landing page fields
    #CP-374
    When I click on the "firstName" field
    Then Check that the "firstName" field is focused
    And The "firstName" field placeholder is "First Name"
    And The cfs "firstName" field label is "First Name" on the mobile page only
    #CP-493
    When I click on the "lastName" field
    Then Check that the "lastName" field is focused
    And The "lastName" field placeholder is "Last Name"
    And The cfs "lastName" field label is "Last Name" on the mobile page only
    #CP-526
    When I click on the "email" field
    Then Check that the "email" field is focused
    And The "email" field placeholder is "Email"
    And The cfs "email" field label is "Email" on the mobile page only
    #CP-518
    When I click on the "zip" field
    Then Check that the "zip" field is focused
    And The "zip" field placeholder is "Zip Code"
    And The cfs "zip" field label is "Zip Code" on the mobile page only

    #checkbox added to ticket CP-460
    When I click on the "communicationPreferences" field
    Then Check that the "communicationPreferences" field is focused
    Then Check that the "communicationPreferences" field is checked
    When I click on the "communicationPreferences" field
    Then Check that the "communicationPreferences" field is not checked
    And The "communicationPreferences" field label is "Yes, please send special offers from NotCheckFreeScore.org and partners to my email."

    #CP-468
    And I focus on the "cta-button" field
    And The "cta-button" message contains "Your Score - Now"

  Scenario: Landing page elements
    #CP-301 duplicate #CP-451
    Then The "search-img" element present on the page
    And The "search-img" element shall not be hyperlinked
    #CP-394
    Then The "left-img" element present on the desktop page only
    And The "left-img" element shall not be hyperlinked desktop page only
    #CP-345
    And The "benefits" message contains "Instantly Access Your Credit Score"
    And The "benefits" message contains "Secure Online Delivery"
    And The "benefits" message contains "No Credit Card Required"
    And The "benefits" message contains "See Score In Under 60 Seconds"
    #CP-357
    Then The "score-img" element present on the page
    And The "score-img" element shall not be hyperlinked
    #CP-329
    And The "landing-h1" message contains "Get Your Free Credit Score"
    And The "landing-h2" message contains "from TransUnion: No Credit Card Required!"
    #CP-323
      Then The "arrow-img" element present on the page
    #CP-471
    And The "legend" message contains "Start Here"
    #CP-516
    And The "<h5> in check-score-text" message contains "Why do I need to check my Credit Score?"
    And The "<p> in check-score-text" message contains "A good credit score is your passport to competitive interest rates for mortgages, cars, credit card offers, job offers, insurance premiums and more. A strong score is worth money because it saves you in excess costs."
    #CP-467
    And The "no-harm-text" message contains "Checking your credit will not harm your score"
