Feature: cfs/step2-fieldValidation-dateOfBirth.feature

  Covers
    - CP-297 Desktop/Mobile - CFS - Step 2 Page - Date Of Birth Dropdowns

  Validation scenarios for Date of Birth input field in Step 2 of Acquisition Flow.
    - Is a required field
    - Users can select the Month, Date and Year from a series of drop-down menus.
    - Dropdown choices for Month include - Month, 01,02,03,04,05,06,07,08,09,10,11,12
    - Dropdown choices for Date include - Day, 01, 02, 03........ 31
    - Dropdown choices for Year include - years that meet age requirements 18-99 years

  Background: user on Step 2 acquisition flow screen
    Given I am a user on the cfs flow
    Given I am on the cfs step2 page


  Scenario: Date of Birth Field Border Glow
    When I select "12" on the "dobMonth" field
    And The "dobMonth" field border shall have a highlighted focus border
    And I select "23" on the "dobDay" field
    And The "dobDay" field border shall have a highlighted focus border
    And I select "1989" on the "dobYear" field
    And The "dobYear" field border shall have a highlighted focus border

  Scenario: 1 - User selects the Date, Month and Year
    When I select "12" on the "dobMonth" field
    And I select "23" on the "dobDay" field
    And I select "1989" on the "dobYear" field
    When I click element "cta-button"
    Then I shall be displayed no error for the "dobMonth" field
    Then I shall be displayed no error for the "dobDay" field
    Then I shall be displayed no error for the "dobYear" field

  Scenario: 3 - User focuses on the Date of Birth field that has the error and fixes it
    And I select "12" on the "dobMonth" field
    And I select "31" on the "dobDay" field
    And I select "2000" on the "dobYear" field
    When I click element "cta-button"
    And The "dobMonth" field border is outlined in red color
    And The "dobDay" field border is outlined in red color
    And The "dobYear" field border is outlined in red color
    When I click element "cta-button"
    And I select "2" on the "dobMonth" field
    And I select "23" on the "dobDay" field
    And I select "1989" on the "dobYear" field
    When I click element "cta-button"
    Then The "dobMonth" field border shall have a default border
    Then The "dobDay" field border shall have a default border
    Then The "dobYear" field border shall have a default border

  Scenario: 4 - User enters invalid date
    And I select "2" on the "dobMonth" field
    And I select "31" on the "dobDay" field
    And I select "1920" on the "dobYear" field
    When I click element "cta-button"
    And The "dobMonth" field border is outlined in red color
    And The "dobDay" field border is outlined in red color
    And The "dobYear" field border is outlined in red color

  Scenario: 2a - Focused mode of Month
    Then I shall be displayed "Month" option for the "dobMonth" field by default
    And I shall be able to select only one "dobMonth" at a time
    When I have selected valid "dobMonth" option I see the correct value
      | month_selected | value |
      | January        | 1     |
      | February       | 2     |
      | March          | 3     |
      | April          | 4     |
      | May            | 5     |
      | June           | 6     |
      | July           | 7     |
      | August         | 8     |
      | September      | 9     |
      | October        | 10    |
      | November       | 11    |
      | December       | 12    |

  Scenario: 2b - Focused mode of Day
    Then I shall be displayed "Day" option for the "dobDay" field by default
    And I shall be able to select only one "dobDay" at a time
    When I have selected valid "dobDay" option I see the correct value
      | day_selected | value |
      | 01           | 1     |
      | 02           | 2     |
      | 03           | 3     |
      | 04           | 4     |
      | 05           | 5     |
      | 06           | 6     |
      | 07           | 7     |
      | 08           | 8     |
      | 09           | 9     |
      | 10           | 10    |
      | 11           | 11    |
      | 12           | 12    |
      | 13           | 13    |
      | 14           | 14    |
      | 15           | 15    |
      | 16           | 16    |
      | 17           | 17    |
      | 18           | 18    |
      | 19           | 19    |
      | 20           | 20    |
      | 21           | 21    |
      | 22           | 22    |
      | 23           | 23    |
      | 24           | 24    |
      | 25           | 25    |
      | 26           | 26    |
      | 27           | 27    |
      | 28           | 28    |
      | 29           | 29    |
      | 30           | 30    |
      | 31           | 31    |

  Scenario: 2c - Focused mode of Year
    Then I shall be displayed "Year" option for the "dobYear" field by default
    And I shall be able to select only one "dobYear" at a time
    When I have selected valid dobYear option I see the correct value
    And I shall not be displayed invalid year in the dobYear field

    #  Note - Date of Birth - Field Name will turn red and Error Message appears only when the user has focused on all the 3 dropdowns - Month, Day & Year. User could have selected 1 or 2 fields, please note the error is displayed when all the 3 are focused.
