Feature: Counter
  The counter should be incremented when the button is pressed.
  (Note: Second example will fail deliberately to demonstrate the failure)

  Scenario Outline: Counter increases when the button plus is pressed
    Given I refresh the counter
    When I tap the plus button 10 times
    Then I expect the counter to be "<expected>"

    Examples:
    |expected|
    | 10     |
    | 5      |
