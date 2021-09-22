#language: en
@startup
Feature: Gather wheather data for a particular city

Scenario: Login dotz web site
    Given I go to the login page
    When I enter my CPF
    Then I enter my password
    Then I see I am logged in