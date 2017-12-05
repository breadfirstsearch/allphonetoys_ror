Feature: User login
  Create a new user and login successfully
  Correct password should take the user to the next page
  Incorrect username or password gives error message
  Username should be a valid email id

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
    
    Given I am on the login page
    
  Scenario: Create a new user and login successfully
    When I follow "Sign Up"
    Then I am on the signup page
    
    When I fill in "user_name" with "xyz"
    And I fill in "user_email" with "abc@test.com"
    And I fill in "user_phone" with "9876543210"
    And I fill in "user_password" with "qwerty"
    And I fill in "user_pref_amount" with "23"
    
    And I press "Sign Up"
    Then I should see "Pref location can't be blank"
    And I should see "Pref provider can't be blank"
    
    Then I select "Lyca" from "user_pref_provider"
    Then I select "Gardens" from "user_pref_location"
    And I press "Sign Up"
    
    Then I should see "User was successfully created."
    
    When I sign in as "abc@test.com" and "qwerty"
    Then I should be on the schedulepickup page
    Then I should see "Log out"
    
    And I follow "Log out"
    Then I am on the login page
    
    When I sign in as "abc@test.com" and "q"
    Then I should see "Invalid email/password"
    And I should be on the login page
    
    When I sign with invalid email as "abc"
    Then I should see "Invalid email/password"
    
    Then I should see "Forgot Password?"
    When I follow "Forgot Password?"
    Then I should see "Resets Password"
    Then I press "Reset Password"
    Then I should see "Email sent with password reset instructions."
    Then I should be on the home page