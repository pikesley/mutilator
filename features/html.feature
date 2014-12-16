Feature: Get mutilated HTML

  Background:
    Given I send and accept HTML

  Scenario: Return simple HTML
    When I go to '/a'
#    Then the response status should be "200"
    And I should see "a"

  Scenario: Return longer HTML
    When I go to '/this is a longer string'
#    When I send a GET request to "/this is a longer string"
#    Then the response status should be "200"
    Then I should see /t..s is a l....r s....g/
