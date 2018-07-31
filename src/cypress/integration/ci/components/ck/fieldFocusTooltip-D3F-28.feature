Feature: Step 1 email and password tooltips

  I am shown helpfull tooltip while I interact input data in a field
  Tooltips are shown regardless of input data and disapear when removed.
  Tooltips are not shown on mobile view

  Covers
    - D3F-28 Tooltip behavior for Email Address and Password

  Background:
    Given I am a user on the ck flow
    Given I am on the ck step1 signup page

    #D3F-28
  Scenario: 0 - no interaction with fields and no tooltips show

    When without entering "email"
    Then "email" tooltip is not visible
    Then "password" tooltip is not visible

  Scenario: 1a User focuses on Email Address input field triggering tooltip
    When I focus on the "email" field
    Then I am displayed a "email" tooltip - "Your email address will be used to log in to your account." on desktop only
    Then The "email" field is focused

  Scenario: 1b enters invalid email triggering tooltip
    When I have enter invalid "email" value "userguy" that "does not yet contain @"
    Then I am displayed a "email" tooltip - "Your email address will be used to log in to your account." on desktop only
    Then The "email" field is focused

  Scenario: 1c enters valid email triggering tooltip and leave field focus
    When I have enter valid "email" value "userguy@example.com"
    Then I am displayed a "email" tooltip - "Your email address will be used to log in to your account." on desktop only
    Then The "email" field is focused

    When I focus on the "password" field
    Then "email" tooltip is not visible

  Scenario: 2a User focuses on Create Password triggering tooltip
    When I focus on the "password" field
    Then I am displayed a "password" tooltip - "This should be at least 8 characters. Try to pick something that's not easy to guess." on desktop only
    When I focus on the "password" field
    Then The "password" field is focused

  Scenario: 2b enters invalid Password triggering tooltip
    And I have enter invalid "password" value "asdf123" that "does not meet the required minimum character length"
    Then I am displayed a "password" tooltip - "This should be at least 8 characters. Try to pick something that's not easy to guess." on desktop only
    Then The "password" field is focused

  Scenario: 2c enters valid Password triggering tooltip and leave field focus
    And I have enter valid "password" value "asdf123@F"
    Then I am displayed a "password" tooltip - "This should be at least 8 characters. Try to pick something that's not easy to guess." on desktop only
    Then The "password" field is focused

    When I focus on the "email" field
    Then "password" tooltip is not visible




