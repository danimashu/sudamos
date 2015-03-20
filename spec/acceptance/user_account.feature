Feature: User account

  Scenario: Sign up as particular
    Given an unregistered user
    When the user sign up as particular
    Then the user can see his account created

  Scenario: Sign up as professional
    Given an unregistered user
    When the user sign up as professional
    Then the user can see his account created

  Scenario: Sign in
    Given a registered user
    Then the user can sign in

  Scenario: Sign out
    Given a signed in user
    Then the user can sign out

  Scenario: Edit profile
    Given a signed in user
    Then the user can edit his profile

  Scenario: Remember password
    Given a registered user
    When the user forget a password
    Then the user can reset the password

  Scenario: Log in through Facebook with existing account
    Given a registered user
    Then the user can sign in throught Facebook for an existing account
    And the user can sign out

  Scenario: Log in through Facebook with new account
    Given an unregistered user
    Then the user can sign in throught Facebook for a new account
    And the user can sign out

  Scenario: Log in through Facebook with not real email
    Given an unregistered user
    Then the user cannot sign in throught Facebook for not real email

  Scenario: Log in through Facebook with a wrong response
    Given an unregistered user
    Then the user cannot sign in throught Facebook for wrong response
