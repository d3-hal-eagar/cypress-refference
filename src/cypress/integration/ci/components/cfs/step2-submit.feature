Feature: cfs/step2-submit.feature

  Test results of valid and invalid field entry

  Covers
  -


  Background:
    Given I am a user on the cfs flow
    Given I am on the cfs step2 page
    Given the siteName is "NotCheckFreeScore"


  Scenario: step2 fields empty
    When I click on the "ssn1" field
    When I click on the "ssn2" field
    When I click on the "ssn4" field
    When I click on the "email" field
    When I click on the "password" field
    And I click on the "cta-button" field
    Then I am guided to the cfs step2 page
    And The "ssn1" field border is outlined in red color
    And The "ssn2" field border is outlined in red color
    And The "ssn4" field border is outlined in red color
    And The "email" field border is outlined in red color
    And The "password" field border is outlined in red color
    #dob fields are in valid state by default

  Scenario: step2 fields valid
    And I have enter valid "ssn1" value "132"
    And I have enter valid "ssn2" value "63"
    And I have enter valid "ssn4" value "1234"
    And I select "3" on the "dobMonth" field
    And I select "3" on the "dobDay" field
    And I select "1933" on the "dobYear" field
    When I have enter unique "email" value "sine@wavy.com"
    When I have enter valid "password" value "lorb12$V"
    And I click on the "cta-button" field
    Then I am guided to the cfs step3A authentication page

  Scenario: step2 invalid values entered
    When I have enter invalid "email" value "bork" that "has no @ or tld"
    When I have enter invalid "password" value "blork!" that "no numbers"
    And I select "2" on the "dobMonth" field
    And I select "31" on the "dobDay" field
    And I select "1920" on the "dobYear" field
    And I click on the "cta-button" field
    Then I am guided to the cfs step2 page
    And The "email" field border is outlined in red color
    And "email" value is "bork"
    And "password" value is "blork!"

  #CP-311
  Scenario: Step 2 Page Default Keyboard Navigation
    When I click on the "ssn1" field
    #enter with all invalid
    When I enter additional text into "password" field text "{enter}"
    When I wait "500"
    Then I am guided to the cfs step2 page
    And The "ssn1" field border is outlined in red color
    And The "ssn2" field border is outlined in red color
    And The "ssn4" field border is outlined in red color
    And The "email" field border is outlined in red color
    And The "password" field border is outlined in red color
    #ssn1 invalid is ssn1
    Then Check that the "ssn1" field is focused
    When I have enter valid "ssn1" value "432"
    When I enter additional text into "password" field text "{enter}"
    When I wait "500"
    Then I am guided to the cfs step2 page
    Then The "ssn1" field border shall have a default border
    #ssn1 invalid is lastName
    Then Check that the "ssn2" field is focused
    And The "ssn2" field border is outlined in red color
    And The "ssn4" field border is outlined in red color
    And The "email" field border is outlined in red color
    And The "password" field border is outlined in red color
#    #enter all valid
    And I have enter valid "ssn1" value "132"
    And I have enter valid "ssn2" value "63"
    And I have enter valid "ssn4" value "1234"
    And I select "3" on the "dobMonth" field
    And I select "3" on the "dobDay" field
    And I select "1933" on the "dobYear" field
    When I have enter unique "email" value "sine@wavy.com"
    When I have enter valid "password" value "lorb12$V"
    When I enter additional text into "password" field text "{enter}"
    Then I am guided to the cfs step3A authentication page
