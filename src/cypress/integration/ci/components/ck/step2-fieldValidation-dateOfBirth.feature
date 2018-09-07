Feature: Date of Birth - Validation Criteria and Error Handling

  Covers
  D3F-46

  Validation scenarios for Date of Birth input field in Step 2 of Acquisition Flow.
  - Is a required field
  - Users can select the Month, Date and Year from a series of drop-down menus.
  - Dropdown choices for Month include - Month, 01,02,03,04,05,06,07,08,09,10,11,12
  - Dropdown choices for Date include - Day, 01, 02, 03........ 31
  - Dropdown choices for Year include - 2008, 2007, 2006,.......1901.

  Background: user on Step 2 acquisition flow screen
    Given I am a user on the ck flow
    When I am on the ck step2 form page


  Scenario: 1 - User selects the Date, Month and Year
    And I select "02" on the "dobMonth" field
    And I select "23" on the "dobDay" field
    And I select "1989" on the "dobYear" field
    Then Action detail "A system is running a validation"
    And I shall be displayed no error for the "dobMonth" field
    And I shall be displayed no error for the "dobDay" field
    And I shall be displayed no error for the "dobYear" field

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
#todo    And I shall not be displayed invalid year in the "dobYear" field

#    When I have selected valid "dobYear" option I see the correct value
#      | year_selected | value |
#      | 2000          | 2000  |
#      | 1919          | 1919  |

  Scenario: 3 - User without selecting a Date, Month and Year focuses out of DOB Field.
    When without entering "dobMonth"
    Then "dobMonth" select field is displayed in red
    And "dobDay" select field is displayed in black
    And "dobYear" select field is displayed in black
#    And "dob" field label is displayed in black
    When without entering "dobDay"
    Then "dobMonth" select field is displayed in red
    And "dobDay" select field is displayed in red
    And "dobYear" select field is displayed in black
    #    And "dob" field label is displayed in black
    When without entering "dobYear"
    Then "dobMonth" select field is displayed in red
    And "dobDay" select field is displayed in red
    And "dobYear" select field is displayed in red
    #    And "dob" field label is displayed in red

  Scenario: 3a - User without selecting a Date, Month and Year focuses out of DOB Field - error message is appeared.
    When without entering "dobMonth"
    When without entering "dobDay"
    When without entering "dobYear"
#    Then I shall be displayed an error for the "dob" field - "Please choose a Month, Please choose a Day, Please choose a year" in red

    #  Note - Date of Birth - Field Name will turn red and Error Message appears only when the user has focused on all the 3 dropdowns - Month, Day & Year. User could have selected 1 or 2 fields, please note the error is displayed when all the 3 are focused.

  Scenario: 3b - User focuses on the Date of Birth field that has the error -" Please choose a month. Please chose a day. Please choose a year."
    When without entering "dobMonth"
    When without entering "dobDay"
    When without entering "dobYear"
#    Then I shall be displayed an error for the "Please choose a Month, Please choose a Day, Please choose a year" field - "dob" in red
    When I select "02" on the "dobMonth" field
    And I select "23" on the "dobDay" field
    And I select "1989" on the "dobYear" field
    And I blur the "dobYear" field
    Then Action detail "A system is running a validation"
    And I shall be displayed no error for the "dob" field
    And "dobMonth" select field is displayed in black
    And "dobDay" select field is displayed in black
    And "dobYear" select field is displayed in black
    And "dob" field label is displayed in black

