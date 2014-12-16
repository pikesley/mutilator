Feature: Get mutilated HTML

  Background:
    Given I send and accept HTML

  Scenario: Return simple HTML
    When I send a GET request to "/a"
    Then the response status should be "200"
    And the XML response should have "//body//div//div//div" with the text "a"
#    And I should see "a"

  Scenario: Return longer HTML
    When I send a GET request to "/this%20is%20a%20longer%20string"
    Then the response status should be "200"
    And show me the response
    And the XML response should have "//body//div//div//div"
