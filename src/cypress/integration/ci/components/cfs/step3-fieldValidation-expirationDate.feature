Feature: cfs/step3-fieldValidation-expirationDate.feature

  Covers
    - CP-2260 Desktop/Mobile - CFS - Step 3 CC Page - Confirm Offer Button
    - CP-2286 Mobile - CFS - Step 3 CC Page - Credit Card Information Section

  Validation scenarios for Expiration Date input field in Step 3 of Acquisition Flow.
    - Is a required field
    - Users can select the Month and Year from a series of drop-down menus.
    - Dropdown choices for Month include - Month, 01,02,03,04,05,06,07,08,09,10,11,12
    - Dropdown choices for Year include - years that meet age requirements 18-99 years

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


#  Scenario: Correct default values pre-selected
#    Then Default value "01" on the "ccExpMonth" field is displayed
#    Then Default value "2018" on the "ccExpYear" field is displayed

  Scenario: Expiration Date Field Border Glow
    When I select "12" on the "ccExpMonth" field
    When I focus on the "ccExpMonth" field
    And The "ccExpMonth" field border shall have a highlighted focus border
    Then I select "11 - Nov" on the "ccExpMonth" field and the correct value "11" is displayed

    And I select "2022" on the "ccExpYear" field
    When I focus on the "ccExpYear" field
    And The "ccExpYear" field border shall have a highlighted focus border
    Then I select "2031" on the "ccExpYear" field and the correct value "2031" is displayed

  Scenario: 1 - User selects the Month and Year
    When I select "12" on the "ccExpMonth" field
    And I select "2022" on the "ccExpYear" field
    When I click element "cta-button"
    Then I shall be displayed no error for the "ccExpMonth" field
    Then I shall be displayed no error for the "ccExpYear" field

  Scenario: 3 - User focuses on the Expiration Date field that has the error and fixes it
#    And I select "01" on the "ccExpMonth" field
#    And I select "2018" on the "ccExpYear" field
    When I click element "cta-button"
    Then I shall be displayed an error for the "ccExpYear" field - "Credit Card - Expiration Date is invalid." in red
    And The "ccExpMonth" field border is outlined in red color
    And The "ccExpYear" field border is outlined in red color
    When I click element "cta-button"
    And I select "02" on the "ccExpMonth" field
    And I select "2022" on the "ccExpYear" field
    When I click element "cta-button"
    Then The "ccExpMonth" field border shall have a default border
    Then The "ccExpYear" field border shall have a default border

  Scenario: 4 - User enters invalid date (in the past)
    And I select "01" on the "ccExpMonth" field
    And I select "2018" on the "ccExpYear" field
    When I click element "cta-button"
    And The "ccExpMonth" field border is outlined in red color
    And The "ccExpYear" field border is outlined in red color
    Then I shall be displayed an error for the "ccExpYear" field - "Credit Card - Expiration Date is invalid." in red


  Scenario: 2a - Focused mode of Month
    And I shall be able to select only one "ccExpMonth" at a time
    When I have selected valid "ccExpMonth" option I see the correct value
      | month_selected | value |
      | 01 - Jan       | 01    |
      | 02 - Feb       | 02    |
      | 03 - Mar       | 03    |
      | 04 - Apr       | 04    |
      | 05 - May       | 05    |
      | 06 - Jun       | 06    |
      | 07 - Jul       | 07    |
      | 08 - Aug       | 08    |
      | 09 - Sep       | 09    |
      | 10 - Oct       | 10    |
      | 11 - Nov       | 11    |
      | 12 - Dec       | 12    |

  Scenario: 2c - Focused mode of Year
    And I shall be able to select only one "ccExpYear" at a time
    When I have selected valid "ccExpYear" option I see the correct value
      | year_selected | value |
      | 2022          | 2022  |
      | 2028          | 2028  |
      | 2033          | 2033  |
    And I shall see the next 15 years only in the "ccExpYear" field

