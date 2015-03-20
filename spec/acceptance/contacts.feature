Feature: Contacts

  Background:
    Given an advert created

  Scenario: Contact advert
    Then the visitor can contact with the advert
    And the user receives an email

  Scenario: Contact user
    Then the visitor can contact with the user
    And the user receives an email