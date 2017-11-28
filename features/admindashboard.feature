Feature: Admin dashboard
  View all users list
  View transactions list
  View Pickups list
  View Recharges list
  View Locations list
  View Providers list
  Log out successfully
  Redirect AllPhoneToys label to the same page

  Background:
    Given I am on the admins create page
    Then I should see "New Admin"
    When I follow "New Admin"
    Then I should see "Email"
    Then I fill in "admin_name" with "shaik"
    And I fill in "admin_email" with "shaik@gmail.com"
    And I fill in "admin_password" with "shaik123"
    And I press "Create Admin"
    Then I should see "Admin was successfully created."
    Given I am on the login page
    Then I should see "Don't have an account?"
    When I am signed in as an admin
    Then I should see "Admin Dashboard"
  
  Scenario: View all users list
    When I follow "All users"
    Then I should see "Name"
    And I should see "Email"
    
  Scenario: View transactions list
    When I follow "Transactions"
    Then I should see "Name"
    And I should see "Amount"
    And I should see "Phonenumber"
    And I should see "Provider"
    And I should see "Location"
    And I should see "Status"

  Scenario: View Pickups list
    When I follow "Pickups"
    Then I should see "Name"
    And I should see "Amount"
    And I should see "Phonenumber"
    And I should see "Provider"
    And I should see "Location"
    And I should see "Status"
    
  Scenario: View Recharges list
    When I follow "Recharges"
    Then I should see "Name"
    And I should see "Amount"
    And I should see "Phonenumber"
    And I should see "Provider"
    And I should see "Location"
    And I should see "Status"
    
  Scenario: View Timings list
    When I follow "Timings"
    Then I should see "Day"
    And I should see "Time"
    And I should see "Action"
    When I am on the timings new page
    Then I should see "All users"
    When I select "Mon" from "timing_day"
    When I select "12" from "timing_hours"
    When I select "00" from "timing_minutes"
    When I select "pm" from "timing_ampm"
    When I press "Add Timing"
    Then I should see "Timing was successfully created."

  Scenario: View Locations list
    When I follow "Locations"
    Then I should see "Location ID"
    And I should see "Location"
    And I should see "Action"

  Scenario: View Providers list
    When I follow "Providers"
    Then I should see "Provider ID"
    And I should see "Provider"
    And I should see "Action"

  Scenario: Log out successfully
    When I follow "Log out"
    Then I am on the login page
    And I should see "Don't have an account?"

  Scenario: Redirect AllPhoneToys label to the same page
    When I follow "All Phone Toys"
    Then I am on the admin dashboard page
    And I should see "Admin Dashboard"
 