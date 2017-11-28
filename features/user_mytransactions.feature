Feature: My transactions Info
  My transactions Info

  Background:
    Given I am signed in
    And I should see "My transactions"
    
  Scenario: Browse My transactions
    When I follow "My transactions"
    Then I should see "Search transactions by :"
    Then I should see "Name"
    And I should see "Amount"
    And I should see "Phonenumber"
    And I should see "Provider"
    And I should see "Location"
    And I should see "Status"
    And I should see "Pickup Date"
    And I should see "Recharge on"