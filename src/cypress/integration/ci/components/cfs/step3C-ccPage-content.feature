Feature: cfs/step3C-ccPage-content.feature

  The CC Page shall be invoked following successful KBA completion if the user's credit score is beneath
  a designated level (variable, configureable will initially be 600 points)

  Covers:
  - CP-2259 Desktop - CFS - Step 3 - CC Page
  - CP-2265 Mobile - CFS - Step 3 - CC Page
  - CP-2535 Mobile - CFS - Step 3 Page - Offer Details above CTA (Revision for Scenario 8 of CP-2265 )

  Background:
    Given I am a user on the cfs flow
    Given the siteName is "NotCheckFreeScore"
    Given Register "Donald Blair"
    Given Mock KBA
    Given I am on the cfs step3A authentication page
    Then Wait for not exists ".loading-modal"
    Then Action detail "I have reached Step 3CC"

  Scenario: 1 - identity-confirmation with firstname lastname and cta button
  #CP-418
  #Scenario: Submit Valid KBA
    Given Mock KBA pass
    Given Mock scores-quick "250"
    When I fill out kba questions and submit
    Then I am guided to the cfs step3A authentication page

    #CP-521
    And The ".success-message-top in identity-confirmation-message" message contains "Donald"
    And The ".success-message-top in identity-confirmation-message" message contains "Blair"
    And The ".success-message-top in identity-confirmation-message" message contains "your identity has been confirmed and your score is ready!"
    And The ".success-message-bottom in identity-confirmation-message" message contains "TransUnion Credit Score"
    And The ".success-message-bottom in identity-confirmation-message" message contains "Pulling Your Accounts on File"
    And The ".success-message-bottom in identity-confirmation-message" message contains "Equifax Credit Score"
    And The ".success-message-bottom in identity-confirmation-message" message contains "Experian Credit Score"
    And The ".success-message-bottom in identity-confirmation-message" message contains "Credit Bureau Monitoring"
    And The ".success-message-bottom in identity-confirmation-message" message contains "Processed"

    #CP-2259
    # Some attributes/tests should be changed after CP-2487 will be fixed
    And The ".provide-info in identity-confirmation-message" message contains "Please provide your payment information for your $1.00 trial and membership"
    And Expect "ccName" not to exist
    When I click on the "ccNum" field
    Then Check that the "ccNum" field is focused
    And The "ccNum" field label is "Card Number:"
    And The "<img.lock-circle within identity-confirmation-message" element present on the page
    And The "ccExpMonth" element present on the page
    And The "ccExpYear" element present on the page
    And The "ccExpMonth" field label is "Expiration Date:"
    And The "ccCvv" element present on the page
    And The "ccCvv" field label is "CVV:"
    And The ".offer-details" message contains "Offer Details"
    And The "trialMobile" message contains " 7-Day $1 Trial Ends" on the mobile page only
    And The "trialEnd" message contains "7-Day $1 Trial Ends" on the desktop page only
    And The "membership" message contains "Monthly Membership for just $39.90 after trial until cancelled" on the desktop page only
    And The "trialMobile" message contains "Monthly Membership for just $39.90 after trial until cancelled" on the mobile page only
    And The "cancellation" message contains "To Cancel, Just Call (855) 506-9167"
    And The "trialMobile" message contains "To cancel, just call (855) 506-9167"
    And "trialEnd" desktop "trialMobile" mobile date is 7 days from now
    And The ".glyphicon-ok-sign within trialMobile" element present on the mobile page only

    And The "score-arrow" element present on the desktop page only
    # CP-2480 Desktop - CFS Step 3 CC Page (Revision of CP-2259) 7.  Card Type
    And The "cc-type-list" element present on the page
    And The "cc-type-amex" element present on the page
    And The "cc-type-mastercard" element present on the page
    And The "cc-type-visa" element present on the page
    And The "cc-type-discover" element present on the page




    And The "cta-button" message contains "I agree and accept. Take me to my score."
