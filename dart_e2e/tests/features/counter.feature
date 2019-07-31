
Feature: test the counters as if from the open api

  Scenario: I test the counter
    Given I reset the counter
    When I increase it by 5
    Then It should have a value of 5
    When I increase it by -20
    Then It should have a value of -15
    And I reset the counter
    And It should have a value of 0
