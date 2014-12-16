Feature: XML

  Background:
    Given I send and accept XML

  Scenario: Return simple(!) XML
    When I send a GET request to "/a"
    Then the response status should be "200"
    And the XML response should have "mutilation"
    And the XML response should have "mutilation/source" with the text "a"

  Scenario: Get longer XML
    When I send a GET request to "/here%20is%20a%20string%20that%20is%20a%20bit%20longer"
    Then the response status should be "200"
    And the XML response should have "mutilation/source" with the text "here is a string that is a bit longer"
    And the XML response should have "mutilation/mutilated"
