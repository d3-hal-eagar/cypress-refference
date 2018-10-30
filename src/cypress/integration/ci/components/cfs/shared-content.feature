Feature: cfs/shared-content.feature

  As a user when I am on the "cfs landing" page then I am displayed the following blocks

  Covers
    - CP-449 Desktop/Mobile - CFS - Right Side Security Certificate Image (landing, 1,2,3,4,4)
    - CP-527 Desktop/Mobile - CFS - Left Side Security Certificate Image (landing, 1,2,3,4,4)
    - CP-515 Desktop/Mobile - CFS - Customers Served Image (landing, 1,2,3,4,4)
    - CP-428 Desktop - CFS - Header Credit Bureau Logo


  Background:
    Given We make siteName "IasadGeas" and flow is "cfs"
    Given I am a user on the cfs flow
    Given the siteName is "IasadGeas"
    Given the siteDomain is "IasadGeas.cc"


  Scenario: Landing Page Content
    Given I am on the cfs landing page
    #CP-449
    Then The "<img.spr-mcafee on mcaffe-logo" element present on the page
    #And "<a> on mcaffe-logo" is Hyperlinked to "https://www.mcafeesecure.com/RatingVerify?ref=checkfreescore.com"
    #domain possibly from token?
    And "<a> on mcaffe-logo" Hyperlink includes "https://www.mcafeesecure.com/RatingVerify?ref="
    And "<a> on mcaffe-logo" Hyperlink includes siteDomain
    And "<a> on mcaffe-logo" targets opening in a new tab
    #CP-527
    Then The "<img.verisign on verisign-logo" element present on the page
    And "<a> on verisign-logo" Hyperlink includes "https://trustsealinfo.verisign.com/splash"
    And "<a> on verisign-logo" Hyperlink includes siteDomain
    #CP-515
    Then The "badge-img" element present on the page
    #CP-428
    And The ".navbar" message contains siteName
    And Expect "nav-transunion" to exist

  Scenario: step1 Page Content
    Given I am on the cfs step1 page
    #CP-449
    Then The "<img.spr-mcafee on mcaffe-logo" element present on the page
    And "<a> on mcaffe-logo" Hyperlink includes "https://www.mcafeesecure.com/RatingVerify?ref="
    And "<a> on mcaffe-logo" targets opening in a new tab
    And "<a> on mcaffe-logo" Hyperlink includes siteDomain
    #CP-527
    Then The "<img.verisign on verisign-logo" element present on the page
    And "<a> on verisign-logo" Hyperlink includes "https://trustsealinfo.verisign.com/splash"
    And "<a> on verisign-logo" Hyperlink includes siteDomain
    #CP-515
    Then The "badge-img" element present on the mobile page only
    #CP-428
    And The ".navbar" message contains siteName
    And Expect "nav-transunion" to exist

  Scenario: step2 Page Content
    Given I am on the cfs step2 page
    #CP-449
    Then The "<img.spr-mcafee on mcaffe-logo" element present on the page
    And "<a> on mcaffe-logo" Hyperlink includes "https://www.mcafeesecure.com/RatingVerify?ref="
    And "<a> on mcaffe-logo" targets opening in a new tab
    #CP-527
    Then The "<img.verisign on verisign-logo" element present on the page
    And "<a> on verisign-logo" Hyperlink includes "https://trustsealinfo.verisign.com/splash"
    #CP-515
    Then The "badge-img" element present on the mobile page only
    #CP-428
    And The ".navbar" message contains siteName
    And Expect "nav-transunion" to exist

  Scenario: step3A authentication page Content
    Given I am on the cfs step3A authentication page
    #CP-449
    Then The "<img.spr-mcafee on mcaffe-logo" element present on the page
    And "<a> on mcaffe-logo" Hyperlink includes "https://www.mcafeesecure.com/RatingVerify?ref="
    And "<a> on mcaffe-logo" targets opening in a new tab
    #CP-527
    Then The "<img.verisign on verisign-logo" element present on the page
    And "<a> on verisign-logo" Hyperlink includes "https://trustsealinfo.verisign.com/splash"
    #CP-515
    Then The "badge-img" element present on the mobile page only
    #CP-428
    And The ".navbar" message contains siteName
    And Expect "nav-transunion" to exist

  Scenario: step4 view Page Content
    Given Mock Report for "Donald Blair"
    Given I am on the cfs step4 view page
    #CP-515
    Then The "badge-img" element present on the mobile page only
    #CP-428
    And The ".navbar" message contains siteName
    And Expect "nav-transunion" not to exist
