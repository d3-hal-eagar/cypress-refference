Feature: cfs/shared-content.feature

  As a user when I am on the "cfs landing" page then I am displayed the following blocks

  Covers
    - CP-449 Desktop/Mobile - CFS - Right Side Security Certificate Image (landing, 1,2,3,4,4)
    - CP-527 Desktop/Mobile - CFS - Left Side Security Certificate Image (landing, 1,2,3,4,4)
    - CP-515 Desktop/Mobile - CFS - Customers Served Image (landing, 1,2,3,4,4)
    - CP-428 Desktop - CFS - Header Credit Bureau Logo
    - CP-498 Desktop/Mobile - CFS - Secure Site Seal Image (1,2,3,4,4)


  Background:
    Given We make siteName "IasadGeas" and flow is "cfs"
    Given I am a user on the cfs flow
    Given the siteName is "IasadGeas"
    Given the siteDomain is "IasadGeas.io"


  Scenario: Landing Page Content
    Given I am on the cfs landing page
    #CP-449
    Then The "<img.spr-mcafee on mcaffe-logo" element present on the page
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
    #And The ".navbar" message contains siteName
    And I am displayed flow Logo
    #CP-2477
    And Expect "nav-bureaus" to exist

  Scenario: step1 Page Content
    Given I am on the cfs step1 page
    #CP-498
    #CP-2493
    Then The "secure-site-section" element present on the page
    And The "secure-site-section" message contains "Secure Site"
    And The "secure-site-section" message contains "We are committed to protecting your information"
    Then The "<img[alt="Secure Site Seal"]> on secure-site-section" element present on the page
    Then The "badge-img on secure-site-section" element present on the page
    And The "verisign-logo on secure-site-section" element present on the page
    And The "mcaffe-logo on secure-site-section" element present on the page
    And The "<img.verisign on verisign-logo" element present on the page
    And "<a> on verisign-logo" Hyperlink includes "https://trustsealinfo.verisign.com/splash"
    And "<a> on verisign-logo" Hyperlink includes siteDomain
    And The "<img.spr-mcafee on mcaffe-logo" element present on the page
    And "<a> on mcaffe-logo" Hyperlink includes "https://www.mcafeesecure.com/RatingVerify?ref="
    And "<a> on mcaffe-logo" targets opening in a new tab
    And "<a> on mcaffe-logo" Hyperlink includes siteDomain
    And The "<img.img-responsive.badge on secure-site-section" element present on the page
    And The "<img.img-responsive.badge on secure-site-section" element shall not be hyperlinked
    #CP-428
    #And The ".navbar" message contains siteName
    And I am displayed flow Logo
    #CP-2477
    And Expect "nav-bureaus" to exist

  Scenario: step2 Page Content
    Given I am on the cfs step2 page
    #CP-498
    #CP-2493
    Then The "secure-site-section" element present on the page
    Then The "badge-img on secure-site-section" element present on the page
    And The "verisign-logo on secure-site-section" element present on the page
    And The "mcaffe-logo on secure-site-section" element present on the page
    And The "<img.verisign on verisign-logo" element present on the page
    And "<a> on verisign-logo" Hyperlink includes "https://trustsealinfo.verisign.com/splash"
    And "<a> on verisign-logo" Hyperlink includes siteDomain
    And The "<img.spr-mcafee on mcaffe-logo" element present on the page
    And "<a> on mcaffe-logo" Hyperlink includes "https://www.mcafeesecure.com/RatingVerify?ref="
    And "<a> on mcaffe-logo" targets opening in a new tab
    And "<a> on mcaffe-logo" Hyperlink includes siteDomain
    And The "<img.img-responsive.badge on secure-site-section" element present on the page
    And The "<img.img-responsive.badge on secure-site-section" element shall not be hyperlinked
    #CP-428
    #And The ".navbar" message contains siteName
    And I am displayed flow Logo
    #CP-2477
    And Expect "nav-bureaus" to exist

  Scenario: step3A authentication page Content
    Given I am on the cfs step3A authentication page
    #CP-498
    #CP-2493
    Then The "secure-site-section" element present on the page
    Then The "badge-img on secure-site-section" element present on the page
    And The "verisign-logo on secure-site-section" element present on the page
    And The "mcaffe-logo on secure-site-section" element present on the page
    And The "<img.verisign on verisign-logo" element present on the page
    And "<a> on verisign-logo" Hyperlink includes "https://trustsealinfo.verisign.com/splash"
    And "<a> on verisign-logo" Hyperlink includes siteDomain
    And The "<img.spr-mcafee on mcaffe-logo" element present on the page
    And "<a> on mcaffe-logo" Hyperlink includes "https://www.mcafeesecure.com/RatingVerify?ref="
    And "<a> on mcaffe-logo" targets opening in a new tab
    And "<a> on mcaffe-logo" Hyperlink includes siteDomain
    And The "<img.img-responsive.badge on secure-site-section" element present on the page
    And The "<img.img-responsive.badge on secure-site-section" element shall not be hyperlinked
    #CP-428
    #And The ".navbar" message contains siteName
    And I am displayed flow Logo
    #CP-2477
    And Expect "nav-bureaus" to exist

  Scenario: step3B
    Given Register "Donald Blair"
    Given Mock KBA
    Given I am on the cfs step3A authentication page
    Then Wait for not exists ".loading-modal"
    #CP-498
    #CP-2493
    Then The "secure-site-section" element present on the page
    Then The "badge-img on secure-site-section" element present on the page
    And The "verisign-logo on secure-site-section" element present on the page
    And The "mcaffe-logo on secure-site-section" element present on the page
    And The "<img.verisign on verisign-logo" element present on the page
    And "<a> on verisign-logo" Hyperlink includes "https://trustsealinfo.verisign.com/splash"
    And "<a> on verisign-logo" Hyperlink includes siteDomain
    And The "<img.spr-mcafee on mcaffe-logo" element present on the page
    And "<a> on mcaffe-logo" Hyperlink includes "https://www.mcafeesecure.com/RatingVerify?ref="
    And "<a> on mcaffe-logo" targets opening in a new tab
    And "<a> on mcaffe-logo" Hyperlink includes siteDomain
    And The "<img.img-responsive.badge on secure-site-section" element present on the page
    And The "<img.img-responsive.badge on secure-site-section" element shall not be hyperlinked
    #CP-428
    #And The ".navbar" message contains siteName
    And I am displayed flow Logo
    #CP-2477
    And Expect "nav-bureaus" to exist

  Scenario: step3C
    Given Register "Donald Blair"
    Given Mock KBA
    Given I am on the cfs step3A authentication page
    Then Wait for not exists ".loading-modal"
    And I am displayed flow Logo
    #CP-2477
    And Expect "nav-bureaus" to exist
    #CP-498
    #CP-2493
    Then The "secure-site-section" element present on the page
    Then The "badge-img on secure-site-section" element present on the page
    And The "verisign-logo on secure-site-section" element present on the page
    And The "mcaffe-logo on secure-site-section" element present on the page
    And The "<img.verisign on verisign-logo" element present on the page
    And "<a> on verisign-logo" Hyperlink includes "https://trustsealinfo.verisign.com/splash"
    And "<a> on verisign-logo" Hyperlink includes siteDomain
    And The "<img.spr-mcafee on mcaffe-logo" element present on the page
    And "<a> on mcaffe-logo" Hyperlink includes "https://www.mcafeesecure.com/RatingVerify?ref="
    And "<a> on mcaffe-logo" targets opening in a new tab
    And "<a> on mcaffe-logo" Hyperlink includes siteDomain
    And The "<img.img-responsive.badge on secure-site-section" element present on the page
    And The "<img.img-responsive.badge on secure-site-section" element shall not be hyperlinked

  Scenario: step4 view Page Content
    Given Mock Report for "Donald Blair"
    Given I am on the cfs step4 view page
    #CP-428
    #And The ".navbar" message contains siteName
    And I am displayed flow Logo
#    #CP-2477
#    And Expect "nav-bureaus" to exist
