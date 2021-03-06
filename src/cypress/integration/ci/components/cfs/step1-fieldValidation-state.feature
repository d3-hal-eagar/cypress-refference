Feature: cfs/step1-fieldValidation-state.feature

  Covers
    - CP-291 Desktop/Mobile - CFS - Step 1 Page - State Dropdown
  Validation Criteria
    - Is a required field.
    - Dropdown


  Background: user on Step 1 acquisition flow screen
    Given I am a user on the cfs flow
    Given I am on the cfs step1 page


  Scenario: 1 - User selects State from the dropdown
    When I select "AK" on the "state" field
    And I click element "cta-button"
    Then I shall be displayed no error for the "state" field

  Scenario: 2 System by default displays 'Select' and on focusing on State field highlights 'Select'.
    Then I shall be displayed "Select..." option for the "state" field by default
    When Action detail "on focusing 'State' field system highlights 'Select' and displays all the state options"
    When I have selected valid "state" option I see the correct value
      | state_selected | value_index |
      | AK             | AK          |
      | AL             | AL          |
      | AR             | AR          |
      | AZ             | AZ          |
      | CA             | CA          |
      | CO             | CO          |
      | CT             | CT          |
      | DC             | DC          |
      | DE             | DE          |
      | FL             | FL          |
      | GA             | GA          |
      | HI             | HI          |
      | IA             | IA          |
      | ID             | ID          |
      | IL             | IL          |
      | IN             | IN          |
      | KS             | KS          |
      | KY             | KY          |
      | LA             | LA          |
      | MA             | MA          |
      | MD             | MD          |
      | ME             | ME          |
      | MI             | MI          |
      | MN             | MN          |
      | MO             | MO          |
      | MS             | MS          |
      | MT             | MT          |
      | NC             | NC          |
      | ND             | ND          |
      | NE             | NE          |
      | NH             | NH          |
      | NJ             | NJ          |
      | NM             | NM          |
      | NV             | NV          |
      | NY             | NY          |
      | OH             | OH          |
      | OK             | OK          |
      | OR             | OR          |
      | PA             | PA          |
      | PR             | PR          |
      | RI             | RI          |
      | SC             | SC          |
      | SD             | SD          |
      | TN             | TN          |
      | TX             | TX          |
      | UT             | UT          |
      | VA             | VA          |
      | VT             | VT          |
      | WA             | WA          |
      | WV             | WV          |
      | WI             | WI          |
      | WY             | WY          |
      | AA             | AA          |
      | AE             | AE          |
      | AP             | AP          |
      | VI             | VI          |
      | GU             | GU          |
      | MP             | MP          |

  Scenario: 3 - System shall allow the user to select only one option/State at a time.
    Then I shall be able to select only one "state" at a time

  Scenario: 4 - User without selecting a state, focuses out of state field.
    And without entering "state"
    And I click element "cta-button"
    #CP-514 #Then I shall be displayed an error for the "state" field - "State/Province cannot be blank." in red
    Then I shall be displayed an error for the "state" field - "Please select a State/Province." in red

    And "state" select field is displayed in red

  Scenario: 4a - User focuses back on state field that has error message
    When without entering "state"
    And I click element "cta-button"
    And "state" select field is displayed in red
    And I click element "cta-button"
    And I select "NY" on the "state" field
    And I click element "cta-button"
    Then I shall be displayed no error for the "state" field

