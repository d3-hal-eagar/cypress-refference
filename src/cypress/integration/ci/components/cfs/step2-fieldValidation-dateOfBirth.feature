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


  Scenario: 1 - User selects the Date, Month and Year
    When I select "02" on the "dobMonth" field
    And I select "23" on the "dobDay" field
    And I select "1989" on the "dobYear" field
    When I click element "cta-button"
    Then I shall be displayed no error for the "dobMonth" field
    Then I shall be displayed no error for the "dobDay" field
    Then I shall be displayed no error for the "dobYear" field

  Scenario: 2a - Focused mode of Month
    Then I shall be displayed "Month" option for the "dobMonth" field by default
    And I shall be able to select only one "dobMonth" at a time
    When I have selected valid "dobMonth" option I see the correct value
      | month_selected | value |
      | 01             | 1     |
      | 02             | 2     |
      | 03             | 3     |
      | 04             | 4     |
      | 05             | 5     |
      | 06             | 6     |
      | 07             | 7     |
      | 08             | 8     |
      | 09             | 9     |
      | 10             | 10    |
      | 11             | 11    |
      | 12             | 12    |

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

  Scenario: 3a User without selecting a Date, Month and Year focuses out of DOB Field.
    When without entering "dobMonth"
    When I click element "cta-button"
    Then "dobMonth" select field is displayed in red
    And "dobDay" select field is displayed in black
    And "dobYear" select field is displayed in black

    When without entering "dobDay"
    When I click element "cta-button"
    Then "dobMonth" select field is displayed in red
    And "dobDay" select field is displayed in red
    And "dobYear" select field is displayed in black

    When without entering "dobYear"
    When I click element "cta-button"
    Then "dobMonth" select field is displayed in red
    And "dobDay" select field is displayed in red
    And "dobYear" select field is displayed in red

  Scenario: 3c User without selecting a Month focuses out of DOB Field - error message is appeared.
    When without entering "dobMonth"
    And I select "23" on the "dobDay" field
    And I select "1989" on the "dobYear" field
    When I click element "cta-button"
    And The "dobMonth" field border is outlined in red color
    Then The "dobDay" field border shall have a default border
    Then The "dobYear" field border shall have a default border

  Scenario: 3d User without selecting a Day focuses out of DOB Field - error message is appeared
    When I select "02" on the "dobMonth" field
    And without entering "dobDay"
    And I select "1989" on the "dobYear" field
    When I click element "cta-button"
    Then The "dobMonth" field border shall have a default border
    And The "dobDay" field border is outlined in red color
    Then The "dobYear" field border shall have a default border

  Scenario: 3e - User without selecting a Year focuses out of DOB Field - error message is appeared.
    When I select "02" on the "dobMonth" field
    And I select "23" on the "dobDay" field
    And without entering "dobYear"
    When I click element "cta-button"
    Then The "dobMonth" field border shall have a default border
    Then The "dobDay" field border shall have a default border
    And The "dobYear" field border is outlined in red color

    #  Note - Date of Birth - Field Name will turn red and Error Message appears only when the user has focused on all the 3 dropdowns - Month, Day & Year. User could have selected 1 or 2 fields, please note the error is displayed when all the 3 are focused.

  Scenario: 3f - User focuses on the Date of Birth field that has the error
    When without entering "dobMonth"
    And without entering "dobDay"
    And without entering "dobYear"
    When I click element "cta-button"
    And I select "02" on the "dobMonth" field
    And I select "23" on the "dobDay" field
    And I select "1989" on the "dobYear" field
    When I click element "cta-button"
    Then The "dobMonth" field border shall have a default border
    Then The "dobDay" field border shall have a default border
    Then The "dobYear" field border shall have a default border
