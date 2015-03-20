Feature: Adverts

  Background:
    Given an advert created

  Scenario: List advert
    Then the visitor can see the advert listed
    And the visitor can filter by the state

  Scenario: Advert details
    Then the visitor can see the detail of an advert