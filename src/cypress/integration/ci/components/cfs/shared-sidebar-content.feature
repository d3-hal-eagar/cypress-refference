Feature: cfs/shared-sidebar-content.feature

  I am displayed the sidebar blocks on steps 1-4

  Covers
    - CP-403 Desktop/Mobile - CFS - Assuage Error Fear Message (copy requirement)  (1,2,3,4,4)
    - CP-307 Desktop/Mobile - CFS - Sample Credit Score Image (1,2,3,4,4)
    - CP-498 Desktop/Mobile - CFS - Secure Site Seal Image (1,2,3,4,4)
    - CP-2476 Desktop/Mobile - CFS - Benefits Message
    - CP-2494 Desktop/Mobile - CFS - Assuage Error Fear Message (Revision of CP-403)


  Background:
    Given We make siteName "IasadGeas" and flow is "cfs"
    Given I am a user on the cfs flow
    Given the siteName is "IasadGeas"
    Given the siteDomain is "IasadGeas.io"


  Scenario: step1 Page Content
    Given I am on the cfs step1 page
    #CP-403
    #CP-2601
    Then The "side-footer-section" element present on the page
    And The "side-footer-section" message contains "Should I expect to find errors in my credit profile?"
    And The "side-footer-section" message contains "It's likely, according to financial experts and analysts. Your credit report can include errors and inaccuracies that can lower your credit score. As a member of "
    And The "side-footer-section" message contains ", you'll have access to your credit report from all 3 credit bureaus - TransUnion, Experian, Equifax - so you can be sure that your credit information is correct."
    And The "side-footer-section" message contains siteDomain
    #CP-307
    Then The "<img.yourcreditscore within [data-test=sample-score-section]" element present on the page
    And The "<img.yourcreditscore within [data-test=sample-score-section]" element shall not be hyperlinked
    #CP-498
    Then The "<img.securesite within [data-test=secure-site-section]" element present on the page
    And The "<img.securesite within [data-test=secure-site-section]" element shall not be hyperlinked
    #CP-2476
    Then The "benefits-message-section" element present on the page
    And The "benefits-message-section" message contains "What are the benefits of my "
    And The "benefits-message-section" message contains " Membership?"
    And The "benefits-message-section" message contains "You will have unlimited access to:"
    And The "benefits-message-section" message contains "24/7 Credit Monitoring"
    And The "benefits-message-section" message contains "E-mail Alerts about changes in your credit"
    And The "benefits-message-section" message contains "Credit Education Center access"
    And The "benefits-message-section" message contains "Social Security Number Monitoring"
    And The "benefits-message-section" message contains "Identity Theft Protection"
    And The "benefits-message-section" message contains siteDomain


  Scenario: step2 Page Content
    Given I am on the cfs step2 page
    #CP-403
    #CP-2601
    Then The "side-footer-section" element present on the page
    And The "side-footer-section" message contains "Should I expect to find errors in my credit profile?"
    And The "side-footer-section" message contains "It's likely, according to financial experts and analysts. Your credit report can include errors and inaccuracies that can lower your credit score. As a member of "
    And The "side-footer-section" message contains ", you'll have access to your credit report from all 3 credit bureaus - TransUnion, Experian, Equifax - so you can be sure that your credit information is correct."
    And The "side-footer-section" message contains siteDomain
    #CP-307
    Then The "<img.yourcreditscore within [data-test=sample-score-section]" element present on the page
    And The "<img.yourcreditscore within [data-test=sample-score-section]" element shall not be hyperlinked
    #CP-498
    Then The "<img.securesite within [data-test=secure-site-section]" element present on the page
    And The "<img.securesite within [data-test=secure-site-section]" element shall not be hyperlinked
    #CP-2476
    Then The "benefits-message-section" element present on the page
    And The "benefits-message-section" message contains "What are the benefits of my "
    And The "benefits-message-section" message contains " Membership?"
    And The "benefits-message-section" message contains "You will have unlimited access to:"
    And The "benefits-message-section" message contains "24/7 Credit Monitoring"
    And The "benefits-message-section" message contains "E-mail Alerts about changes in your credit"
    And The "benefits-message-section" message contains "Credit Education Center access"
    And The "benefits-message-section" message contains "Social Security Number Monitoring"
    And The "benefits-message-section" message contains "Identity Theft Protection"
    And The "benefits-message-section" message contains siteDomain

  Scenario: step3A Page Content
    Given I am on the cfs step3A authentication page
    #CP-403
    #CP-2601
    Then The "side-footer-section" element present on the page
    And The "side-footer-section" message contains "Should I expect to find errors in my credit profile?"
    And The "side-footer-section" message contains "It's likely, according to financial experts and analysts. Your credit report can include errors and inaccuracies that can lower your credit score. As a member of "
    And The "side-footer-section" message contains ", you'll have access to your credit report from all 3 credit bureaus - TransUnion, Experian, Equifax - so you can be sure that your credit information is correct."
    And The "side-footer-section" message contains siteDomain
    #CP-307
    Then The "<img.yourcreditscore within [data-test=sample-score-section]" element present on the page
    And The "<img.yourcreditscore within [data-test=sample-score-section]" element shall not be hyperlinked
    #CP-498
    Then The "<img.securesite within [data-test=secure-site-section]" element present on the page
    And The "<img.securesite within [data-test=secure-site-section]" element shall not be hyperlinked
    #CP-2476
    Then The "benefits-message-section" element present on the page
    And The "benefits-message-section" message contains "What are the benefits of my "
    And The "benefits-message-section" message contains " Membership?"
    And The "benefits-message-section" message contains "You will have unlimited access to:"
    And The "benefits-message-section" message contains "24/7 Credit Monitoring"
    And The "benefits-message-section" message contains "E-mail Alerts about changes in your credit"
    And The "benefits-message-section" message contains "Credit Education Center access"
    And The "benefits-message-section" message contains "Social Security Number Monitoring"
    And The "benefits-message-section" message contains "Identity Theft Protection"
    And The "benefits-message-section" message contains siteDomain

  Scenario: step3 CC Page Content
    Given Register "Donald Blair"
    Given Mock KBA
    Given I am on the cfs step3A authentication page
    Then Wait for not exists ".loading-modal"
    And Action detail "I have reached Step 3CC"
    #CP-403
    #CP-2601
    Then The "side-footer-section" element present on the page
    And The "side-footer-section" message contains "Should I expect to find errors in my credit profile?"
    And The "side-footer-section" message contains "It's likely, according to financial experts and analysts. Your credit report can include errors and inaccuracies that can lower your credit score. As a member of "
    And The "side-footer-section" message contains ", you'll have access to your credit report from all 3 credit bureaus - TransUnion, Experian, Equifax - so you can be sure that your credit information is correct."
    And The "side-footer-section" message contains siteDomain
    #CP-307
    Then The "<img.yourcreditscore within [data-test=sample-score-section]" element present on the page
    And The "<img.yourcreditscore within [data-test=sample-score-section]" element shall not be hyperlinked
    #CP-498
    Then The "<img.securesite within [data-test=secure-site-section]" element present on the page
    And The "<img.securesite within [data-test=secure-site-section]" element shall not be hyperlinked
    #CP-2476
    Then The "benefits-message-section" element present on the page
    And The "benefits-message-section" message contains "What are the benefits of my "
    And The "benefits-message-section" message contains " Membership?"
    And The "benefits-message-section" message contains "You will have unlimited access to:"
    And The "benefits-message-section" message contains "24/7 Credit Monitoring"
    And The "benefits-message-section" message contains "E-mail Alerts about changes in your credit"
    And The "benefits-message-section" message contains "Credit Education Center access"
    And The "benefits-message-section" message contains "Social Security Number Monitoring"
    And The "benefits-message-section" message contains "Identity Theft Protection"
    And The "benefits-message-section" message contains siteDomain
