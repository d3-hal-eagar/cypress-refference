Feature: State - Validation Criteria and when no character is entered

  D3F-44
  Validation scenarios for State input field in Step 2 of Acquisition Flow.

  Validation Rules:
  - Is a required field.
  - Dropdown

  Background: user on Step 2 acquisition flow screen
    Given I am a user on the ck flow
    When I am on the ck step2 form page


  Scenario: 1 - User selects State from the dropdown
    When I select "AK" on the "state" field
    And I focus on the "next-step-button" field
    Then I shall be displayed no error for the "state" field

  Scenario: 2 System by default displays 'Select' and on focusing on State field highlights 'Select'.
    Then I shall be displayed "Select..." option for the "state" field by default
    When Action detail "on focusing 'State' field system highlights 'Select' and displays all the state options"
    When I have selected valid "state" option I see the correct value
      | state_selected | value_index |
      | AK             | 1           |
      | AL             | 2           |
      | AR             | 3           |
      | AZ             | 4           |
      | CA             | 5           |
      | CO             | 6           |
      | CT             | 7           |
      | DC             | 8           |
      | DE             | 9           |
      | FL             | 10          |
      | GA             | 12          |
      | HI             | 13          |
      | IA             | 14          |
      | ID             | 15          |
      | IL             | 16          |
      | IN             | 17          |
      | KS             | 18          |
      | KY             | 19          |
      | LA             | 20          |
      | MA             | 21          |
      | MD             | 22          |
      | ME             | 23          |
      | MI             | 24          |
      | MN             | 25          |
      | MO             | 26          |
      | MS             | 27          |
      | MT             | 28          |
      | NC             | 29          |
      | ND             | 30          |
      | NE             | 31          |
      | NH             | 32          |
      | NJ             | 33          |
      | NM             | 34          |
      | NV             | 35          |
      | NY             | 36          |
      | OH             | 37          |
      | OK             | 38          |
      | OR             | 39          |
      | PA             | 40          |
      | PR             | 41          |
      | RI             | 42          |
      | SC             | 43          |
      | SD             | 44          |
      | TN             | 45          |
      | TX             | 46          |
      | UT             | 47          |
      | VA             | 48          |
      | VT             | 49          |
      | WA             | 50          |
      | WV             | 51          |
      | WI             | 52          |
      | WY             | 53          |
      | AA             | 54          |
      | AE             | 55          |
      | AP             | 56          |
      | VI             | 57          |
      | GU             | 58          |
      | MP             | 59          |

  Scenario: 3 - System shall allow the user to select only one option/State at a time.
    Then I shall be able to select only one "state" at a time

  Scenario: 4 - User without selecting a state, focuses out of state field.
    When I focus on the "state" field
    And I focus on the "next-step-button" field
    And "state" field label is displayed in red
    And "state" field placeholder is displayed in red
    Then I shall be displayed an error for the "state" field - "Select state." in red font color

  Scenario: 4a - User focuses back on state field that has error message
    When Action detail "I focus on state field that has an error - 'Select state.'"
    When I focus on the "state" field
    And I focus on the "next-step-button" field
    When I focus on the "state" field
    And "state" field select is displayed in red
    Then Check that the "state" field is focused
    When Action detail "I enter valid state and the the error message disappears"
    When I select "NY" on the "state" field
    And I focus on the "next-step-button" field
    Then I shall be displayed no error for the "state" field
