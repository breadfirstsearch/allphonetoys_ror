Feature: Schedule a pickup
  Schedule a pickup

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
    
    When I follow "Locations"
    Then I should see "Location ID"
    And I should see "Location"
    And I should see "Action"
    When I am on the locations new page
    Then I should see "All users"
    When I press "Add Location"
    
    When I press "Add Location"
    Then I should see "1 error prohibited this location from being saved:"
    Then I should see "Location can't be blank"
    
    When I fill in "location_location" with "Gardens"
    When I press "Add Location"
    Then I should see "Location was successfully created."
    
     When I follow "Providers"
    Then I should see "Provider ID"
    And I should see "Provider"
    And I should see "Action"
    When I am on the providers new page
    Then I should see "All users"
    
    When I press "Add Provider"
    Then I should see "1 error prohibited this provider from being saved:"
    Then I should see "Provider can't be blank"
    
    When I fill in "provider_provider" with "Lyca"
    When I press "Add Provider"
    Then I should see "Provider was successfully created."
    
    When I follow "Timings"
    Then I should see "Day"
    And I should see "Time"
    And I should see "Action"
    When I am on the timings new page
    Then I should see "All users"
    
    When I press "Add Timing"
    Then I should see "3 errors prohibited this location from being saved:"
    Then I should see "Day can't be blank"
    Then I should see "Hours can't be blank"
    Then I should see "Minutes can't be blank"
#
    When I select "Mon" from "timing_day"
    When I press "Add Timing"
    Then I should see "2 errors prohibited this location from being saved:"
    #Then I should see "Day can't be blank"
    Then I should see "Hours can't be blank"
    Then I should see "Minutes can't be blank"
    
    When I select "1" from "timing_hours"
    When I press "Add Timing"
    Then I should see "1 error prohibited this location from being saved:"
    #Then I should see "Day can't be blank"
    #Then I should see "Hours can't be blank"
    Then I should see "Minutes can't be blank"
    
    When I select "00" from "timing_minutes"
    When I select "pm" from "timing_ampm"
    When I press "Add Timing"
    Then I should see "Timing was successfully created."
    
    
    When I follow "Log out"
    Then I am on the login page
    And I should see "Don't have an account?"
    Given I am signed in
    And I should see "Schedule a pickup"
    
  Scenario: Schedule a pickup successfully
    When I follow "Schedule a pickup"
    
    #Select 
    #first_element = find("#id_of_dropdown > option:nth-child(1)").text
    #select(first_element, :from => "id_of_dropdown")

    Then I should see "Select your service provider"
    Then I should see "Select a pickup date"
    Then I should see "When should we recharge?"
    
    And I press "Schedule"
    Then I should see "Pickupdate can't be blank"
    Then I should see "Rechargedate can't be blank"
    #Then I should see "Transaction was successfully created."
    #hardcoded
    When I select "11 Dec 2017 - 01:00 pm" from "transaction_pickupDate"
    And I press "Schedule"
    Then I should see "Rechargedate can't be blank"
     
    When I select "11 Dec 2017" from "transaction_rechargeDate"
    
    #When I select the first element from "transaction_pickupDate"
    #When I select the first element from "transaction_rechargeDate"
    
    #Then I should see "Select location"
    
    And I fill in "transaction_amount" with "123"
    And I press "Schedule"
    Then I should see "Transaction was successfully created."
    
    Then I should see "123"
    Then I should see "Scheduled"
    And I fill in "search_phone" with "123"
    
    And I press "Search"