Feature: cfs/step3C-ccPage-content.feature

  The CC Page shall be invoked following successful KBA completion if the user's credit score is beneath
  a designated level (variable, configureable will initially be 600 points)

  Covers:
  - CP-2259 Desktop - CFS - Step 3 - CC Page
  - CP-2265 Mobile - CFS - Step 3 - CC Page

  Background:
    Given I am a user on the cfs flow
    Given the siteName is "NotCheckFreeScore"
    Given Register "Donald Blair"

  Scenario: 1 - identity-confirmation with firstname lastname and cta button
    Given Mock KBA
    Given I am on the cfs step3A authentication page
    #CP-360 first loading message
    Then The "modal-body" message contains "Loading questions, please wait..."
    Then Wait for not exists ".loading-modal"

  #CP-418
  #Scenario: Submit Valid KBA
    Given Mock KBA pass
    When I fill out kba questions and submit
    Then I am guided to the cfs step3A authentication page

    #CP-521
    And The ".success-message-top in identity-confirmation-message" message contains "Donald"
    And The ".success-message-top in identity-confirmation-message" message contains "Blair"
    And The ".success-message-top in identity-confirmation-message" message contains "your identity has been confirmed and your score is ready!"
    And The ".success-message-bottom in identity-confirmation-message" message contains "TransUnion Credit Score"
    And The ".success-message-bottom in identity-confirmation-message" message contains "Pulling Your Accounts on File"
    And The ".success-message-bottom in identity-confirmation-message" message contains "Processed"
    And The ".success-message-bottom in identity-confirmation-message" message contains "Processed"

    #CP-2259
    # Some attributes/tests should be changed after CP-2487 will be fixed
    And The ".provide-info in identity-confirmation-message" message contains "Please provide your payment information for your $1.00 trial and membership"
    And The "ccName" element present on the desktop page only
    And The "ccType" element present on the desktop page only
    And The "<img.cc-image within cc-image" element present on the mobile page only
    When I click on the "#ccNum" field
    Then Check that the "#ccNum" field is focused
    And The "ccNum" field label is "Card Number:"
    And The "<img.cc-image within cc-image" element present on the mobile page only
    And The "<img.lock-circle within identity-confirmation-message" element present on the page
    And The "ccExpMonth" element present on the page
    And The "ccExpYear" element present on the page
    And The "ccExpMonth" field label is "Expiration Date:"
    And The "ccCvv" element present on the page
    And The "ccCvv" field label is "CVV:"
    And The ".offer-details" message contains "Offer Details"
    And The ".col-4.d-none.d-md-block" message contains "7-Day $1 Trial Ends"
    And The ".col-4.d-none.d-md-block" message contains "Monthly Membership for just $39.90 after trial until cancelled"
    And The ".col-4.d-none.d-md-block" message contains "To Cancel, Just Call (855) 506-9167"
    And The "cta-button" message contains "I agree and accept. Take me to my score."
