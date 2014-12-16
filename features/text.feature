@text
Feature: Get mutilated text
  Scenario: Return simple text
    When I go to '/a'
    Then I should see "a"

  Scenario: Return longer text
    When I go to '/this is a considerably longer, piece of text'
    Then I should see /t..s is a c..........y l....r, p...e of t..t/
