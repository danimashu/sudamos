Feature: Advert management

  Background:
    Given a signed in user

  @seed
  Scenario: Create advert
    Then the user can create an advert
    And the user can add images
    And the advert is listed in the user adverts list
    And the advert is listed in the adverts list

  Scenario: Edit advert
    Given an advert created
    Then the user can edit the advert
    And the user can edit the images

  Scenario: Retire advert
    Given an advert created
    Then the user can retire the advert
    And the advert is not shown in the list

  Scenario: Renew advert
    Given an advert created
    Then the user can renew the advert