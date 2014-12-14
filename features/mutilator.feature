@html
Feature: Get mutilated HTML

  Scenario: Return simple HTML
    When I go to '/a'
    Then I should see 'a'

  Scenario: Return longer HTML
    When I go to '/this is a longer string'
    Then I should see /t..s is a l....r s....g/
