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
  - CP-2495 Desktop - CFS - Landing Page - Left Side Image (Revision of CP-394)
  - CP-2497 Desktop/Mobile - CFS - Landing Page - Benefits Tout (Revision of CP-345)
  - CP-2525 Mobile - CFS Landing Page - 3 Scores Image
  - CP-2473 Desktop - CFS Landing Page (Revision of CP-477)
  - CP-2519 Mobile - CFS Landing Page (Revision of CP-460)

  Background:
    Given I am a user on the cfs flow
    Given I am on the cfs landing page
    Given the siteName is "NotCheckFreeScore"


  Scenario: 1 - Landing page fields
    #CP-374
    When I click on the "firstName" field
    Then Check that the "firstName" field is focused
    And The "firstName" field label is "First Name:"
    #CP-493
    When I click on the "lastName" field
    Then Check that the "lastName" field is focused
    And The "lastName" field label is "Last Name:"
    #CP-526
    When I click on the "email" field
    Then Check that the "email" field is focused
    And The "email" field label is "Email:"
    #CP-518
    When I click on the "zip" field
    Then Check that the "zip" field is focused
    And The "zip" field label is "Zip Code:"

    #checkbox added to ticket CP-460
    When I click on the "communicationPreferences" field
    Then Check that the "communicationPreferences" field is focused
    Then Check that the "communicationPreferences" field is checked
    When I click on the "communicationPreferences" field
    Then Check that the "communicationPreferences" field is not checked
    And The "communicationPreferences" field label is "Yes, please send special offers from NotCheckFreeScore.org and partners to my email."

    #CP-468
    And I focus on the "cta-button" field
    And The "cta-button" message contains "Your Scores - Now"

  Scenario: 2 - Landing page elements
    #CP-301 duplicate #CP-451
    Then The "search-img" element present on the page
    And The "search-img" element shall not be hyperlinked
    #CP-2519
    And The "badge-img-mobile" element present on the mobile page only
    And The "badge-img" element present on the desktop page only
    #CP-394
    #CP-2495
    Then The "left-img" element present on the desktop page only
    And The "left-img" element shall not be hyperlinked desktop page only
    #CP-345
    #CP-2497
    And The "benefits" message contains "Instantly Access Your 3 Credit Scores"
    And The "benefits" message contains "Secure Online Delivery"
    And The "benefits" message contains "Daily 3 Bureau Credit Monitoring"
    And The "benefits" message contains "Roadside Assistance"
    #CP-357
    Then The "score-img" element present on the page
    And The "score-img" element shall not be hyperlinked
    #CP-329
    #CP-2473
    And The "landing-h1" message contains "Get Your Free Credit Scores"
    And The "landing-h2" message contains "from All 3 Bureaus as of"
    And "landing-h2" message contains current date
    And The "trial-end-date" message contains "7-Day $1 Trial"
    And The "trial-end-date" message contains "Ends "
    And "trial-end-date" message contains date "7" days from now
    And The "trial-terms" message contains "Monthly Membership for just $39.90"
    And The "trial-terms" message contains "after trial until cancelled"
    And The "trial-cancellation" message contains "To cancel, Just call"
    And The "trial-cancellation" message contains "(855) 506-9160"
#   @hal, I commented it since can't find for what test is it.
#    And The ".glyphicon-ok-sign within trialMobile" element present on the mobile page only
    #CP-323
    Then The "arrow-img" element present on the page
    #CP-471
    And The "legend" message contains "Start Here"
    #CP-516
    And The "<h5> in check-score-text" message contains "Why do I need to check my Credit Score?"
    And The "<p> in check-score-text" message contains "A good credit score is your passport to competitive interest rates for mortgages, cars, credit card offers, job offers, insurance premiums and more. A strong score is worth money because it saves you in excess costs."
    #CP-467
    And The "no-harm-text" message contains "Checking your credit will not harm your score"
    #CP-2525
    #CP-2519
    Then The "3-scores-img" element present on the mobile page only
    And The "3-scores-img" element shall not be hyperlinked mobile page only
    Then The "3-scores-arrow" element present on the mobile page only
    And The "3-scores-arrow" element shall not be hyperlinked mobile page only
