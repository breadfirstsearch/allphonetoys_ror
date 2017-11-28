Feature: Available Timings Info
  Available Timings Info

  Background:
    Given I am signed in
    And I should see "Available Timings"
    
  Scenario: Update user date successfully
    When I follow "Available Timings"
    Then I should see "Date"
    Then I should see "Day"
    Then I should see "Time"