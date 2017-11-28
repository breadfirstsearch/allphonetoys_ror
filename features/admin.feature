Feature: Admin login
  Create a new admin
  Log in as admin successfully

  Background:
    Given I am on the admins create page
    Then I should see "New Admin"
    Then I should see "Admins"

  Scenario: Create new admin
    When I follow "New Admin"
    Then I should see "Email"
    Then I fill in "admin_name" with "shaik"
    And I fill in "admin_email" with "shaik@gmail.com"
    And I fill in "admin_password" with "shaik123"
    And I press "Create Admin"
    Then I should see "Admin was successfully created."
    
  Scenario: Browse through created admin details
    When I follow "New Admin"
    Then I should see "Email"
    Then I fill in "admin_name" with "shaik"
    And I fill in "admin_email" with "shaik@gmail.com"
    And I fill in "admin_password" with "shaik123"
    And I press "Create Admin"
    Then I should see "Admin was successfully created."
    When I am on the admins create page
    Then I should see "Show"
    
    
    When I follow "Show"
    Then I should see "Name: shaik"
    Then I should see "Email: shaik@gmail.com"
    Then I should see "Password: shaik123"
    Then I should see "Back"
    When I follow "Back"
    Then I should be on the admins create page
    
    Then I should see "Edit"
    When I follow "Edit"
    Then I fill in "admin_name" with "shaik1"
    When I press "Update Admin"
    Then I should see "Admin was successfully updated."
    And I should see "Name: shaik1"
    Then I should see "Back"
    When I follow "Back"
    Then I should be on the admins create page
    
    Then I should see "Destroy"
    When I follow "Destroy"
    Then I should see "Admin was successfully destroyed."
    
   
  Scenario: Admin signed in successfully
    When I follow "New Admin"
    Then I should see "Back"
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
    
  Scenario: Admin sign out successfully
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
    Then I should see "Log out"
    When I follow "Log out"
    Then I should see "Don't have an account?"