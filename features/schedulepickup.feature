Feature: Schedule a pickup
  Schedule a pickup

  Background:
    Given I am signed in
    And I should see "Schedule a pickup"
    
  Scenario: Schedule a pickup successfully
    When I follow "Schedule a pickup"
    Then I should see "Select your service provider"
    Then I should see "Select location"
    And I fill in "transaction_amount" with "123"
    And I press "Schedule"
    Then I should see "Transaction was successfully created."
    Then I should see "123"
    Then I should see "Scheduled"
    And I fill in "search_phone" with "123"
    And I press "Search"