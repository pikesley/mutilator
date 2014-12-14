@html
Feature: HTML

  Scenario: Return HTML
    When I go to '/a'
    Then I should see 'a'
