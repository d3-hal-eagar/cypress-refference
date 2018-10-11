Feature: cfs/step1-fieldValidation-surveyQuestions.feature

  Covers
  - CP-441 Desktop/Mobile - CFS - Step 1 Page - Survey Questions
  Validation Criteria
  - no validation


  Background: user on Step 1 acquisition flow screen
    Given I am a user on the cfs flow
    Given I am on the cfs step1 page


  Scenario: 1 - Radio button behaviour
    When I click on the "survey-yes" field
    Then Check that the "survey-yes" field is focused
    Then Check that the "survey-no" field is not checked
    When I click on the "survey-no" field
    Then Check that the "survey-no" field is focused
    Then Check that the "survey-yes" field is not checked


  Scenario: 2 - Validate content for each question
    #todo pass some trigger to show all questions, and then test each
    And The "survey" message contains "score"


  #functionality moved to future sprint
  #Scenario: 3 - Validate secondary questions are shown
