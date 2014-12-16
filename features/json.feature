Feature: Get mutilated JSON

  Background:
    Given I send and accept JSON

  Scenario: Return simple JSON
    When I send a GET request to "/a"
    Then the response status should be "200"
    Then show me the response
    And the JSON response should be:
    """
    {
      "source": "a",
      "mutilated": "a"
    }
    """

  Scenario: Get longer JSON
    When I send a GET request to "/here%20is%20a%20string%20that%20is%20a%20bit%20longer"
    Then the response status should be "200"
    Then show me the response
    And the JSON response should have "$.source" with the text "here is a string that is a bit longer"
    And the JSON response should have "$.mutilated"
