Feature: cfs/step3CC-submit.feature

  Covers
    - CP-2260 Desktop/Mobile - CFS - Step 3 CC Page - Confirm Offer Button

  Background: user on Step 3CC acquisition flow screen
    Given I am a user on the cfs flow
    Given Register "Donald Blair"
    Given Mock KBA
    Given I am on the cfs step3A authentication page
    Then Wait for not exists ".loading-modal"
    Given Mock KBA pass
    Given Mock scores-quick "812"
    When I fill out kba questions and submit
    Then Action detail "I have reached Step 3CC"


  Scenario: step3CC fields empty
    When I click element "cta-button"
#    Then I shall be displayed an error for the "ccExpYear" field - "Credit Card - Expiration Date is invalid." in red
    Then I shall be displayed an error for the "ccNum" field - "Credit Card - Number cannot be blank." in red
    Then I shall be displayed an error for the "ccCvv" field - "Credit Card - CVV is invalid." in red
    And The "ccExpYear" field border is outlined in red color
    And The "ccExpMonth<" field border is outlined in red color
    And The "ccNum" field border is outlined in red color
    And The "ccCvv" field border is outlined in red color

  Scenario: step3CC fields valid
    When I select "09" on the "ccExpMonth" field
    And I select "2022" on the "ccExpYear" field
    And I have enter valid "ccNum" value "4545454545454545"
    And I have enter valid "ccCvv" value "321"
    When I click element "cta-button"
    Then I am guided to the cfs step4 view page

  Scenario: step3CC invalid values entered
    When I select "04" on the "ccExpMonth" field
    And I select "2018" on the "ccExpYear" field
    And I have enter valid "ccNum" value "000"
    And I have enter valid "ccCvv" value "0"

    When I click element "cta-button"
#    Then I shall be displayed an error for the "ccExpYear" field - "Credit Card - Expiration Date is invalid." in red
    Then I shall be displayed an error for the "ccNum" field - "Credit Card - Number is invalid." in red
    Then I shall be displayed an error for the "ccCvv" field - "Credit Card - CVV is invalid." in red
    And The "ccNum" field border is outlined in red color
    And The "ccCvv" field border is outlined in red color
    And The "ccExpYear" field border is outlined in red color
    And The "ccExpMonth" field border is outlined in red color


  Scenario: step3CC Keyboard Navigation

    When I click on the "ccNum" field
    #enter with all invalid
    When I enter additional text into "ccCvv" field text "22{enter}"
    When I wait "500"
    Then I am guided to the cfs step3A authentication page
    And The "ccNum" field border is outlined in red color
    And The "ccCvv" field border is outlined in red color
    And The "ccExpYear" field border is outlined in red color
    And The "ccExpMonth" field border is outlined in red color
    #first invalid focused
    Then Check that the "ccNum" field is focused
    #enter with valid ccNum
    When I have enter valid "ccNum" value "4545454545454545"
    When I enter additional text into "ccCvv" field text "{enter}"
    When I wait "500"
    Then I am guided to the cfs step3A authentication page
    Then The "ccNum" field border shall have a default border
    And The "ccCvv" field border is outlined in red color
    #first invalid focused
    Then Check that the "ccCvv" field is focused

