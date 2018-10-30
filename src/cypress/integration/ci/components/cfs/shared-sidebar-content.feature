Feature: cfs/shared-sidebar-content.feature

  I am displayed the sidebar blocks on steps 1-4

  Covers
    - CP-403 Desktop/Mobile - CFS - Assuage Error Fear Message (copy requirement)  (1,2,3,4,4)
    - CP-307 Desktop/Mobile - CFS - Sample Credit Score Image (1,2,3,4,4)
    - CP-498 Desktop/Mobile - CFS - Secure Site Seal Image (1,2,3,4,4)


  Background:
    Given We make siteName "IasadGeas" and flow is "cfs"
    Given I am a user on the cfs flow
    Given the siteName is "IasadGeas"
    Given the siteDomain is "IasadGeas.io"


  Scenario: step1 Page Content
    Given I am on the cfs step1 page
    #CP-403
    Then The "side-footer-section" element present on the page
    And The "side-footer-section" message contains "Should I expect to find errors in my credit profile?"
    And The "side-footer-section" message contains "It's likely, according to financial experts and analysts. Your credit report can include errors and inaccuracies that can lower your credit score. As a member of "
    And The "side-footer-section" message contains ", you'll have access to your credit report from TransUnion® credit reporting - so you can review your report for any possible issues."
    And The "side-footer-section" message contains siteDomain
    #CP-307
    Then The "<img.yourcreditscore within [data-test=sample-score-section]" element present on the page
    And The "<img.yourcreditscore within [data-test=sample-score-section]" element shall not be hyperlinked
    #CP-498
    Then The "<img.securesite within [data-test=secure-site-section]" element present on the page
    And The "<img.securesite within [data-test=secure-site-section]" element shall not be hyperlinked

  Scenario: step2 Page Content
    Given I am on the cfs step2 page
    #CP-403
    Then The "side-footer-section" element present on the page
    And The "side-footer-section" message contains "Should I expect to find errors in my credit profile?"
    And The "side-footer-section" message contains "It's likely, according to financial experts and analysts. Your credit report can include errors and inaccuracies that can lower your credit score. As a member of "
    And The "side-footer-section" message contains ", you'll have access to your credit report from TransUnion® credit reporting - so you can review your report for any possible issues."
    And The "side-footer-section" message contains siteDomain
    #CP-307
    Then The "<img.yourcreditscore within [data-test=sample-score-section]" element present on the page
    And The "<img.yourcreditscore within [data-test=sample-score-section]" element shall not be hyperlinked
    #CP-498
    Then The "<img.securesite within [data-test=secure-site-section]" element present on the page
    And The "<img.securesite within [data-test=secure-site-section]" element shall not be hyperlinked

  Scenario: step3A Page Content
    Given I am on the cfs step3A authentication page
    #CP-403
    Then The "side-footer-section" element present on the page
    And The "side-footer-section" message contains "Should I expect to find errors in my credit profile?"
    And The "side-footer-section" message contains "It's likely, according to financial experts and analysts. Your credit report can include errors and inaccuracies that can lower your credit score. As a member of "
    And The "side-footer-section" message contains ", you'll have access to your credit report from TransUnion® credit reporting - so you can review your report for any possible issues."
    And The "side-footer-section" message contains siteDomain
    #CP-307
    Then The "<img.yourcreditscore within [data-test=sample-score-section]" element present on the page
    And The "<img.yourcreditscore within [data-test=sample-score-section]" element shall not be hyperlinked
    #CP-498
    Then The "<img.securesite within [data-test=secure-site-section]" element present on the page
    And The "<img.securesite within [data-test=secure-site-section]" element shall not be hyperlinked

