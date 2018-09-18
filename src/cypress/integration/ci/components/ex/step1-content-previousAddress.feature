Feature: Desktop - EX - Step 1 - Previous Address

  As a user when I am on Step 1 and I need to enter my previous address

  covers
  - CP-835 Desktop - EX - Step 1 Page - Have you lived at this address 6 months or more? - Validation Criteria and Error Handling


  Background: user on Step 2 acquisition flow screen
    Given I am a user on the ex flow
    When I am on the ex step1 signup page
    Given the siteName is "NotCreditExperian"

  Scenario: 1 When user lands on the Step1 of Experian Acquisition flow, by default Yes is selected for the question - Have you lived at this address 6 months or more?
    Then Check that the "continuousResidenceYes" field is checked


  Scenario: 2 User upon selecting No as the option for the question - "Have you lived at this address 6 months or more?"
    Then Check that the "previous-address-section" is not visible
    When I click on the "continuousResidenceNo" field
    Then Check that the "continuousResidenceYes" field is not checked
    Then Check that the "previous-address-section" is visible

    And The "street1 in previous-address-section" field label is "Previous Street Address"
    And The "street2 in previous-address-section" field label is "Apt, Unit, Bldg, Suite"
    And The "zip in previous-address-section" field label is "ZIP Code"
    And The "city in previous-address-section" field label is "City"
    Then The "state in previous-address-section" field label is "State"


  Scenario: Street Address single test validation rules
    When I click on the "continuousResidenceNo" field

    Then Action detail "required"
      When without entering "street1 in previous-address-section"
      Then "street1 in previous-address-section" field displays warning Icon
      And "street1 in previous-address-section" input field shall be outlined in red
      Then I shall be displayed an error for the "street1 in previous-address-section" field - "Please enter your street address." in red

    Then Action detail "enter valid"
      When I have enter valid "street1 in previous-address-section" value "22 Cortland st"
      Then I shall be displayed no error for the "street1 in previous-address-section" field
      And "street1 in previous-address-section" field does not display warning Icon
      And "street1 in previous-address-section" field displays check Icon
      And "street1 in previous-address-section" input field shall be outlined in green

    Then Action detail "maximum length"
      When I have enter valid "street1 in previous-address-section" value "12345678901234567890123456789012345678901234567890123456789012345678901234567890 Address street 7890123"
      Then I am restricted from entering more than "100" characters in "street1 in previous-address-section" field

    Then Action detail "minimum length"
      When I have enter invalid "street1 in previous-address-section" value "1" that "too short"
      Then I shall be displayed an error for the "street1 in previous-address-section" field - "Please enter your street address." in red

    Then Action detail "invalid characters"
      When I have enter invalid "street1 in previous-address-section" value "22 Cortl%nd streeet" that "has an '% symbol"
      And I shall be displayed an error for the "street1 in previous-address-section" field - "Please enter your street address." in red
      When I have enter valid "street1 in previous-address-section" value "22 Cortland st"
      And I shall be displayed no error for the "street1 in previous-address-section" field

    Then Action detail "valid characters"
      When I have enter valid "street1 in previous-address-section" value "a 2 # , - ' . /"
      Then I shall be displayed no error for the "street1 in previous-address-section" field


  Scenario: Apartment single test validation rules
    When I click on the "continuousResidenceNo" field

    Then Action detail "not required"

    Then Action detail "enter valid"
    When I have enter valid "street2 in previous-address-section" value "22 C"
    Then I shall be displayed no error for the "street2 in previous-address-section" field
    And "street2 in previous-address-section" field does not display warning Icon
    And "street2 in previous-address-section" field displays check Icon
    And "street2 in previous-address-section" input field shall be outlined in green

    Then Action detail "maximum length"
    When I have enter valid "street2 in previous-address-section" value "12345678901234567890123456789012345678901234567890123456789012345678901234567890 Address street 789012312345678901234567890a"
    Then I am restricted from entering more than "100" characters in "street2 in previous-address-section" field

    Then Action detail "invalid characters"
    When I have enter invalid "street2 in previous-address-section" value "22 %" that "has an '% symbol"
    And I shall be displayed an error for the "street2 in previous-address-section" field - "Please enter valid address format." in red
    When I have enter valid "street2 in previous-address-section" value "Suite 1103"
    And I shall be displayed no error for the "street2 in previous-address-section" field

    Then Action detail "valid characters"
    When I have enter valid "street2 in previous-address-section" value "a 2 # , - ' . /"
    Then I shall be displayed no error for the "street2 in previous-address-section" field


  Scenario: City single test validation rules
    When I click on the "continuousResidenceNo" field

    Then Action detail "required"
    When without entering "city in previous-address-section"
    Then "city in previous-address-section" field displays warning Icon
    And "city in previous-address-section" input field shall be outlined in red
    Then I shall be displayed an error for the "city in previous-address-section" field - "Please enter a valid city." in red

    Then Action detail "enter valid"
    When I have enter valid "city in previous-address-section" value "New York"
    Then I shall be displayed no error for the "city in previous-address-section" field
    And "city in previous-address-section" field does not display warning Icon
    And "city in previous-address-section" field displays check Icon
    And "city in previous-address-section" input field shall be outlined in green

    Then Action detail "maximum length"
    When I have enter valid "city in previous-address-section" value "abcdefghijklmnopqrstuvwxyzasdf"
    Then I am restricted from entering more than "27" characters in "city in previous-address-section" field

    Then Action detail "no minimum length"

    Then Action detail "invalid characters"
    When I have enter invalid "city in previous-address-section" value "New York2" that "has an '% symbol"
    And I shall be displayed an error for the "city in previous-address-section" field - "Please enter a valid city." in red
    When I have enter valid "city in previous-address-section" value "New York"
    And I shall be displayed no error for the "city in previous-address-section" field

    Then Action detail "valid characters"
    When I have enter valid "city in previous-address-section" value "a - '"
    Then I shall be displayed no error for the "city in previous-address-section" field


  Scenario: State single test validation rules
    When I click on the "continuousResidenceNo" field

    Then Action detail "required"
      And without entering "state in previous-address-section"
      And "state in previous-address-section" select field is displayed in red

    Then Action detail "enter valid"
      When I select "AK" on the "state in previous-address-section" field
      And I blur the "state in previous-address-section" field
    Then The "state in previous-address-section" select border is displayed in green

  Scenario: Zip single test validation rules
    When I click on the "continuousResidenceNo" field

    Then Action detail "required"
    When without entering "zip in previous-address-section"
    Then "zip in previous-address-section" field displays warning Icon
    And "zip in previous-address-section" input field shall be outlined in red
    Then I shall be displayed an error for the "zip in previous-address-section" field - "Please enter a valid zip code." in red

    Then Action detail "enter valid"
    When I have enter valid "zip in previous-address-section" value "10010"
    Then I shall be displayed no error for the "zip in previous-address-section" field
    And "zip in previous-address-section" field does not display warning Icon
    And "zip in previous-address-section" field displays check Icon
    And "zip in previous-address-section" input field shall be outlined in green

    Then Action detail "maximum length"
    When I have enter valid "zip in previous-address-section" value "1234567890"
    Then I am restricted from entering more than "5" characters in "zip in previous-address-section" field

    Then Action detail "no minimum length"

    Then Action detail "invalid characters"
    When I have enter invalid "zip in previous-address-section" value "one23" that "has an letter"
    And I shall be displayed an error for the "zip in previous-address-section" field - "Please enter a valid zip code." in red
    When I have enter valid "zip in previous-address-section" value "87654"
    And I shall be displayed no error for the "zip in previous-address-section" field
