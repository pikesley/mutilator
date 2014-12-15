Feature: XML

  Background:
    Given I send and accept XML

  Scenario: Return simple(!) XML
    When I send a GET request to "/a"
    Then the response status should be "200"
    And the XML response should have "source"
