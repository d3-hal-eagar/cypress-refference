Feature: ex Step 2 Right rail content

  ex acquisition flow, display blocks of information on the right rail

  Covers
  -  D3F-477 Build Order Cancellation

  Background:
    Given the siteName is "NotCreditKarma"

  Scenario: 1 upon receiving an error on Step 2, I get an opportunity to review the information provided before and select 'Submit secure order' again. If the information still does not match the credit files then I am displayed a message on canceling the order.
    Given I am a user on the ex flow
    And I am on the ex step2 form page

    When Action detail "I edited/reviewed data on the fields where information was incorrectly given"
      When I have enter valid "ssn" value "5553334444"
      When I select "11" on the "dobMonth" field
      When I select "11" on the "dobDay" field
      When I select "1985" on the "dobYear" field
      When I have enter valid "username" value "ConsumerJoe"
      When I have enter valid "password" value "1Secure9@55W0rd"
      When I have enter valid "cofirmPassword" value "1Secure9@55W0rd"
    And I click element "submit-button"
    And Action detail "System sends users information to the TU Bureau"
    And Action detail "if the given information still doesn't match the credit files"
    Then I am shown an error apology

  Scenario: 2 on answering incorrect answers to the KBA questions on screen 3, system shall not be able to identify me and thus shall throw me an error and cancel the registration process.
    Given I am a user on the ex flow
    And I am on the ex step3 confirm page
    #And I answer the KBA Questions incorrectly
    And I click element "submit-button"
    Then I am shown an error and cancel the registration process

  Scenario: 3 As a user when I am on Step 3 and I run out of time while answering KBA question in both the occasions then I am thrown an error and registration is canceled.
    Given I am a user on the ex flow
    And I am on the ex step3 confirm page
    #And I answer the KBA Questions incorrectly
    And I click element "submit-button"
    And Action detail "System sends users information to the TU Bureau"
    And Action detail "if the given information still doesn't match the credit files"
    Then I am shown an error and about protecting your personal information