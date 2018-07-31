Feature: Step 1 email tips on hover

  I am given explicit instructions about correcting invalid email when I hover over the email field.
  Display of help is browser function based on field title, and does not display visibly on mobile where hover is not possible.

  Covers
    - D3F-198 As a user when I hover over the entered characters in the email address input field then I am displayed a tooltip

  Background:
    Given I am a user on the ck flow
    Given I am on the ck step1 signup page

    #D3F-198
  Scenario: 1 - User hovers over the characters in the email address input field when invalid

    When without entering "email"
    When I hover over "email" address
    Then "email" field attribute title is not visible

    When I have enter invalid "email" value "userguy" that "does not yet contain @"
    When I focus on the "password" field
    When I hover over "email" address
    Then I am displayed a attribute title on "email" field - "Please include an '@' in the email address. 'userguy' is missing an '@'."

  Scenario: User hovers over the characters in the email address input field when it contains no @

    When I have enter invalid "email" value "userguy.com" that "does not yet contain @"
    When I focus on the "password" field
    When I hover over "email" address
    Then I am displayed a attribute title on "email" field - "Please include an '@' in the email address. 'userguy.com' is missing an '@'."

  Scenario: User hovers over the characters in the email address input field when it lacks domain

    And I have enter invalid "email" value "userguy@" that "lacks domain"
    When I focus on the "password" field
    When I hover over "email" address
    Then I am displayed a attribute title on "email" field - "Please enter a part following '@'. 'userguy@' is incomplete."

  Scenario: User hovers over the characters in the email address input field when it contains valid data

    When I have enter valid "email" value "test@credmo.com"
    When I focus on the "password" field
    When I hover over "email" address
    Then "email" field attribute title is not visible

