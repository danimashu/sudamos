Feature: User contacts management

  Scenario: Manage contacts
    Given a signed in user
    And an advert created
    And a contact created
    And a contact to user created
    Then the user can see a list of general contacts
    And the user can see a list of adverts contacts
    And the user can mark as read the contact
