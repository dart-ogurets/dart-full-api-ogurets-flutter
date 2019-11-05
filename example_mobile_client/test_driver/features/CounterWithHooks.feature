Feature: Demo counter with a hook

  @reset_counter
  Scenario: Use hook to reset the counter and then increase to 10
    Given I expect the counter to be "0"
    When I tap the plus button 10 times
    Then I expect the counter to be "10"
