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
    And I focus on the "street2" field
    Then Action detail "A system is running a validation"
    And I shall be displayed no error for the "dobMonth" field
    And I shall be displayed no error for the "dobDay" field
    And I shall be displayed no error for the "dobYear" field

  Scenario: 2a - Focused mode of Month
    And I focus on the "dobMonth" field
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
    And I focus on the "dobDay" field
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
    And I focus on the "dobYear" field
    Then I shall be displayed "Year" option for the "dobYear" field by default
    And I shall be able to select only one "dobYear" at a time
    When I have selected valid "dobYear" option I see the correct value
      | year_selected | value |
      | 2008          | 2008  |
      | 2007          | 2007  |
      | 2006          | 2006  |
      | 2005          | 2005  |
      | 2004          | 2004  |
      | 2003          | 2003  |
      | 2002          | 2002  |
      | 2001          | 2001  |
      | 2000          | 2000  |
      | 1999          | 1999  |
      | 1998          | 1998  |
      | 1997          | 1997  |
      | 1996          | 1996  |
      | 1995          | 1995  |
      | 1994          | 1994  |
      | 1993          | 1993  |
      | 1992          | 1992  |
      | 1991          | 1991  |
      | 1990          | 1990  |
      | 1989          | 1989  |
      | 1988          | 1988  |
      | 1987          | 1987  |
      | 1986          | 1986  |
      | 1985          | 1985  |
      | 1984          | 1984  |
      | 1983          | 1983  |
      | 1982          | 1982  |
      | 1981          | 1981  |
      | 1980          | 1980  |
      | 1979          | 1979  |
      | 1978          | 1978  |
      | 1977          | 1977  |
      | 1976          | 1976  |
      | 1975          | 1975  |
      | 1974          | 1974  |
      | 1973          | 1973  |
      | 1972          | 1972  |
      | 1971          | 1971  |
      | 1970          | 1970  |
      | 1969          | 1969  |
      | 1968          | 1968  |
      | 1967          | 1967  |
      | 1966          | 1966  |
      | 1965          | 1965  |
      | 1964          | 1964  |
      | 1963          | 1963  |
      | 1962          | 1962  |
      | 1961          | 1961  |
      | 1960          | 1960  |
      | 1959          | 1959  |
      | 1958          | 1958  |
      | 1957          | 1957  |
      | 1956          | 1956  |
      | 1955          | 1955  |
      | 1954          | 1954  |
      | 1953          | 1953  |
      | 1952          | 1952  |
      | 1951          | 1951  |
      | 1950          | 1950  |
      | 1949          | 1949  |
      | 1948          | 1948  |
      | 1947          | 1947  |
      | 1946          | 1946  |
      | 1945          | 1945  |
      | 1944          | 1944  |
      | 1943          | 1943  |
      | 1942          | 1942  |
      | 1941          | 1941  |
      | 1940          | 1940  |
      | 1939          | 1939  |
      | 1938          | 1938  |
      | 1937          | 1937  |
      | 1936          | 1936  |
      | 1935          | 1935  |
      | 1934          | 1934  |
      | 1933          | 1933  |
      | 1932          | 1932  |
      | 1931          | 1931  |
      | 1930          | 1930  |
      | 1929          | 1929  |
      | 1928          | 1928  |
      | 1927          | 1927  |
      | 1926          | 1926  |
      | 1925          | 1925  |
      | 1924          | 1924  |
      | 1923          | 1923  |
      | 1922          | 1922  |
      | 1921          | 1921  |
      | 1920          | 1920  |
      | 1919          | 1919  |
      | 1918          | 1918  |
      | 1917          | 1917  |
      | 1916          | 1916  |
      | 1915          | 1915  |
      | 1914          | 1914  |
      | 1913          | 1913  |
      | 1912          | 1912  |
      | 1911          | 1911  |
      | 1910          | 1910  |
      | 1909          | 1909  |
      | 1908          | 1908  |
      | 1907          | 1907  |
      | 1906          | 1906  |
      | 1905          | 1905  |
      | 1904          | 1904  |
      | 1903          | 1903  |
      | 1902          | 1902  |
      | 1901          | 1901  |
  And I shall not be displayed invalid year in the "dobYear" field

    #  Validation scenarios for Date of Birth drop-down field in Step 2 of Acquisition Flow.

  Scenario: 3 - User without selecting a Date, Month and Year focuses out of DOB Field.
    And I focus on the "dobMonth" field
    And I focus on the "street2" field
    Then "dobMonth" select field is displayed in red
    And "dobDay" select field is displayed in black
    And "dobYear" select field is displayed in black
#    And "dob" field label is displayed in black
    When I focus on the "dobDay" field
    And I focus on the "street2" field
    Then "dobMonth" select field is displayed in red
    And "dobDay" select field is displayed in red
    And "dobYear" select field is displayed in black
    #    And "dob" field label is displayed in black
    When I focus on the "dobYear" field
    And I focus on the "street2" field
    Then "dobMonth" select field is displayed in red
    And "dobDay" select field is displayed in red
    And "dobYear" select field is displayed in red
    #    And "dob" field label is displayed in red

  Scenario: 3a - User without selecting a Date, Month and Year focuses out of DOB Field - error message is appeared.
    When I focus on the "dobMonth" field
    And I focus on the "dobDay" field
    And I focus on the "dobYear" field
    And I focus on the "street2" field
#    Then I shall be displayed an error for the "dob" field - "Please choose a Month, Please choose a Day, Please choose a year" in red font color

    #  Note - Date of Birth - Field Name will turn red and Error Message appears only when the user has focused on all the 3 dropdowns - Month, Day & Year. User could have selected 1 or 2 fields, please note the error is displayed when all the 3 are focused.

  Scenario: 3b - User focuses on the Date of Birth field that has the error -" Please choose a month. Please chose a day. Please choose a year."
    When I focus on the "dobMonth" field
    And I focus on the "dobDay" field
    And I focus on the "dobYear" field
    And I focus on the "street2" field
#    Then I shall be displayed an error for the "Please choose a Month, Please choose a Day, Please choose a year" field - "dob" in red font color
    When I select "02" on the "dobMonth" field
    And I select "23" on the "dobDay" field
    And I select "1989" on the "dobYear" field
    And I focus on the "street2" field
    Then Action detail "A system is running a validation"
    And I shall be displayed no error for the "dobMonth" field
    And I shall be displayed no error for the "dobDay" field
    And I shall be displayed no error for the "dobYear" field
    And "dobMonth" select field is displayed in black
    And "dobDay" select field is displayed in black
    And "dobYear" select field is displayed in black
#    And "dob" field label is displayed in black

