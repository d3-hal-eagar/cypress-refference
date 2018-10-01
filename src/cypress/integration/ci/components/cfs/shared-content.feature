Feature: cfs/landingPage-content.feature

  As a user when I am on the "cfs landing" page then I am displayed the following blocks

  Covers
  - CP-449 Desktop/Mobile - CFS - Right Side Security Certificate Image
  - CP-527 Desktop/Mobile - CFS - Left Side Security Certificate Image
  - CP-515 Desktop/Mobile - CFS - Customers Served Image


  Background:
    Given I am a user on the cfs flow
    Given the siteName is "NotCheckFreeScore"


  Scenario: Landing Page Content
    Given I am on the cfs landing page
    #CP-449
      Then The "<img.spr-mcafee on mcafee2-link" element present on the page
      And "mcafee2-link" is Hyperlinked to "https://www.mcafeesecure.com/RatingVerify?ref=checkfreescore.com"
      And "mcafee2-link" targets opening in a new tab
    #CP-527
      Then The "<img.spr-verisign on verisign2-link" element present on the page
      And "verisign2-link" Hyperlink includes "https://trustsealinfo.verisign.com/splash"
    #CP-515
      Then The "badge-img" element present on the page

  Scenario: step1 Page Content
    Given I am on the cfs step1 page
    #CP-449
      Then The "<img.spr-mcafee on mcafee2-link" element present on the page
      And "mcafee2-link" is Hyperlinked to "https://www.mcafeesecure.com/RatingVerify?ref=checkfreescore.com"
      And "mcafee2-link" targets opening in a new tab
    #CP-527
      Then The "<img.spr-verisign on verisign2-link" element present on the page
      And "verisign2-link" Hyperlink includes "https://trustsealinfo.verisign.com/splash"
    #CP-515
      Then The "badge-img" element present on the mobile page only


  Scenario: step2 Page Content
    Given I am on the cfs step2 page
    #CP-449
      Then The "<img.spr-mcafee on mcafee2-link" element present on the page
      And "mcafee2-link" is Hyperlinked to "https://www.mcafeesecure.com/RatingVerify?ref=checkfreescore.com"
      And "mcafee2-link" targets opening in a new tab
    #CP-527
      Then The "<img.spr-verisign on verisign2-link" element present on the page
      And "verisign2-link" Hyperlink includes "https://trustsealinfo.verisign.com/splash"
    #CP-515
      Then The "badge-img" element present on the mobile page only

  Scenario: step3 Page Content
    Given I am on the cfs step3 page
    #CP-449
      Then The "<img.spr-mcafee on mcafee2-link" element present on the page
      And "mcafee2-link" is Hyperlinked to "https://www.mcafeesecure.com/RatingVerify?ref=checkfreescore.com"
      And "mcafee2-link" targets opening in a new tab
    #CP-527
      Then The "<img.spr-verisign on verisign2-link" element present on the page
      And "verisign2-link" Hyperlink includes "https://trustsealinfo.verisign.com/splash"
    #CP-515
      Then The "badge-img" element present on the mobile page only

  Scenario: step4 Page Content
    Given I am on the cfs step4 page
    #CP-449
      Then The "<img.spr-mcafee on mcafee2-link" element present on the page
      And "mcafee2-link" is Hyperlinked to "https://www.mcafeesecure.com/RatingVerify?ref=checkfreescore.com"
      And "mcafee2-link" targets opening in a new tab
    #CP-527
      Then The "<img.spr-verisign on verisign2-link" element present on the page
      And "verisign2-link" Hyperlink includes "https://trustsealinfo.verisign.com/splash"
    #CP-515
      Then The "badge-img" element present on the mobile page only

