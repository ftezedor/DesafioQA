#language: en
@startup
Feature: Gather wheather data for a particular city

Scenario: Retrieve wheather info for the given city
    Given the user goes to the wheather webpage
    When it pulls off wheather data by city name
    Then display results

Scenario: Retrieve wheather info for the given latitude n longitude
    Given the user goes to the wheather webpage
    When it pulls off wheather data by city coords
    Then display results

Scenario: Retrieve wheather info using the wrong key
    Given the user goes to the wheather webpage with the wrong key
    When it pulls off wheather data by city name
    Then display results