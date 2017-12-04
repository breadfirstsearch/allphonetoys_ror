Feature: Edit profile
  Edit profile info

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
    
    When I follow "Log out"
    Then I am on the login page
    And I should see "Don't have an account?"
    
    #Given I am on the home page
    #When I follow "Sign Up"
    Given I am signed in
    #When I select "Mon" from "timing_day"
    #When I select "12" from "timing_hours"
    And I should see "Edit profile"
    #And I should see "Save"
    
  Scenario: Update user date successfully
    When I follow "Edit profile"
    Then I should see "Choose a password of at least 6 characters"
    And I fill in "user_name" with "xyz123"
    And I press "Save"
    Then I should see "User was successfully updated."
    #Then I should see "xyz123"