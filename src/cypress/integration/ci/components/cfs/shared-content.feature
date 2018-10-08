Feature: cfs/shared-content.feature

  As a user when I am on the "cfs landing" page then I am displayed the following blocks

  Covers
  - CP-449 Desktop/Mobile - CFS - Right Side Security Certificate Image
  - CP-527 Desktop/Mobile - CFS - Left Side Security Certificate Image
  - CP-515 Desktop/Mobile - CFS - Customers Served Image
  - CP-307 Desktop/Mobile - CFS - Sample Credit Score Image
  - CP-498 Desktop/Mobile - CFS - Secure Site Seal Image
  - CP-403 Desktop/Mobile - CFS - Assuage Error Fear Message (copy requirement)


  Background:
    Given I am a user on the cfs flow
    Given the siteName is "NotCheckFreeScore"


  Scenario: Landing Page Content
    Given I am on the cfs landing page
    #CP-449
      Then The "<img.spr-mcafee on mcafee2-link" element present on the page
      #And "mcafee2-link" is Hyperlinked to "https://www.mcafeesecure.com/RatingVerify?ref=checkfreescore.com"
      #domain possibly from token?
      And "mcafee2-link" Hyperlink includes "https://www.mcafeesecure.com/RatingVerify?ref="
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
    #CP-307
    Then The "<img.yourcreditscore within [data-test=sample-score-section]" element present on the page
    And The "<img.yourcreditscore within [data-test=sample-score-section]" element shall not be hyperlinked
    #CP-498
    Then The "<img.securesite within [data-test=secure-site-section]" element present on the page
    And The "<img.securesite within [data-test=secure-site-section]" element shall not be hyperlinked
    #CP-403
    Then The "side-footer-section" element present on the page
    And The "side-footer-section" message contains "Should I expect to find errors in my credit profile?"
    And The "side-footer-section" message contains "It's likely, according to financial experts and analysts. Your credit report can include errors and inaccuracies that can lower your credit score. As a member of "
    And The "side-footer-section" message contains ", you'll have access to your credit report from TransUnion® credit reporting - so you can review your report for any possible issues."
    And The "side-footer-section" message contains siteName

  Scenario: step2 Page Content
    Given I am on the cfs step2 page
    #CP-449
      Then The "<img.spr-mcafee on mcafee2-link" element present on the page
      And "mcafee2-link" Hyperlink includes "https://www.mcafeesecure.com/RatingVerify?ref="
      And "mcafee2-link" targets opening in a new tab
    #CP-527
    Then The "<img.spr-verisign on verisign2-link" element present on the page
    And "verisign2-link" Hyperlink includes "https://trustsealinfo.verisign.com/splash"
    #CP-515
    Then The "badge-img" element present on the mobile page only
    #CP-307
    Then The "<img.yourcreditscore within [data-test=sample-score-section]" element present on the page
    And The "<img.yourcreditscore within [data-test=sample-score-section]" element shall not be hyperlinked
    #CP-498
    Then The "<img.securesite within [data-test=secure-site-section]" element present on the page
    And The "<img.securesite within [data-test=secure-site-section]" element shall not be hyperlinked
    #CP-403
    Then The "side-footer-section" element present on the page
    And The "side-footer-section" message contains "Should I expect to find errors in my credit profile?"
    And The "side-footer-section" message contains "It's likely, according to financial experts and analysts. Your credit report can include errors and inaccuracies that can lower your credit score. As a member of "
    And The "side-footer-section" message contains ", you'll have access to your credit report from TransUnion® credit reporting - so you can review your report for any possible issues."
    And The "side-footer-section" message contains siteName

  Scenario: step3 Page Content
    Given I am on the cfs step3 page
    #CP-449
      Then The "<img.spr-mcafee on mcafee2-link" element present on the page
      And "mcafee2-link" Hyperlink includes "https://www.mcafeesecure.com/RatingVerify?ref="
      And "mcafee2-link" targets opening in a new tab
    #CP-527
      Then The "<img.spr-verisign on verisign2-link" element present on the page
      And "verisign2-link" Hyperlink includes "https://trustsealinfo.verisign.com/splash"
    #CP-515
      Then The "badge-img" element present on the mobile page only
    #CP-307
    Then The "<img.yourcreditscore within [data-test=sample-score-section]" element present on the page
    And The "<img.yourcreditscore within [data-test=sample-score-section]" element shall not be hyperlinked
    #CP-498
    Then The "<img.securesite within [data-test=secure-site-section]" element present on the page
    And The "<img.securesite within [data-test=secure-site-section]" element shall not be hyperlinked
    #CP-403
    Then The "side-footer-section" element present on the page
    And The "side-footer-section" message contains "Should I expect to find errors in my credit profile?"
    And The "side-footer-section" message contains "It's likely, according to financial experts and analysts. Your credit report can include errors and inaccuracies that can lower your credit score. As a member of "
    And The "side-footer-section" message contains ", you'll have access to your credit report from TransUnion® credit reporting - so you can review your report for any possible issues."
    And The "side-footer-section" message contains siteName

  Scenario: step4 Page Content
    Given I am on the cfs step4 authentication page
    #CP-449
    Then The "<img.spr-mcafee on mcafee2-link" element present on the page
    And "mcafee2-link" Hyperlink includes "https://www.mcafeesecure.com/RatingVerify?ref="
    And "mcafee2-link" targets opening in a new tab
    #CP-527
    Then The "<img.spr-verisign on verisign2-link" element present on the page
    And "verisign2-link" Hyperlink includes "https://trustsealinfo.verisign.com/splash"
    #CP-515
    Then The "badge-img" element present on the mobile page only
    #CP-307
    Then The "<img.yourcreditscore within [data-test=sample-score-section]" element present on the page
    And The "<img.yourcreditscore within [data-test=sample-score-section]" element shall not be hyperlinked
    #CP-498
    Then The "<img.securesite within [data-test=secure-site-section]" element present on the page
    And The "<img.securesite within [data-test=secure-site-section]" element shall not be hyperlinked
    #CP-403
    Then The "side-footer-section" element present on the page
    And The "side-footer-section" message contains "Should I expect to find errors in my credit profile?"
    And The "side-footer-section" message contains "It's likely, according to financial experts and analysts. Your credit report can include errors and inaccuracies that can lower your credit score. As a member of "
    And The "side-footer-section" message contains ", you'll have access to your credit report from TransUnion® credit reporting - so you can review your report for any possible issues."
    And The "side-footer-section" message contains siteName
