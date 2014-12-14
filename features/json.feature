@json
Feature: Get mutilated JSON

  Scenario: Return simple JSON
    When I go to '/a'
    Then the response should be JSON:
    """
    {
      "source": "a",
      "mutilated": "a"
    }
    """

  Scenario: Get longer JSON
    When I go to '/here is a string that is a bit longer'
    Then the JSON response should have a field "mutilated" with content /h..e is a s....g t..t is a bit l....r/
