@csv
Feature: Get mutilated CSV
  Scenario: Return simple CSV
    When I go to '/a'
    Then the response should be a text block:
    """
    source,mutilated
    a,a
    """

  Scenario: Return longer CSV
    When I go to '/this is a considerably longer piece of text'
    Then the response should be a text block:
    """
    source,mutilated
    this is a considerably longer piece of text
    """
