@text
Feature: Get mutilated text
  Scenario: Return simple text
    When I go to '/a'
    Then I should see 'a'
