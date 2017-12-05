require 'rails_helper'

describe "On the homepage, users" do
    
    it 'can sign up successfully' do
        #Create user first
        visit '/'
        expect(page).to have_content("Sign up")
        click_link "Sign Up"
        
        fill_in('user_name', :with => 'xyz')
        fill_in('user_email', :with => 'abc@test.com')
        fill_in('user_phone', :with => '9876543210')
        fill_in('user_password', :with => 'qwerty')
        fill_in('user_pref_amount', :with => '23')
        select "Lyca", from: "user_pref_provider", visible: false
        select "Gardens", from: "user_pref_location", visible: false
        click_button('Sign Up')
        
        #debugger
        expect(page).to have_content("User was successfully created.")
    end
    before(:each) do
        visit '/admins'
        expect(page).to have_content("New Admin")
        click_link "New Admin"
        expect(page).to have_content("Email")
        
        fill_in('admin_name', :with => 'shaik')
        fill_in('admin_email', :with => 'shaik@gmail.com')
        fill_in('admin_password', :with => 'shaik123')
        click_button('Create Admin')
        
        #debugger
        expect(page).to have_content("Admin was successfully created.")
        
        visit '/login'
        expect(page).to have_text("Don't have an account?")
        fill_in 'email', :with => "shaik@gmail.com"
        fill_in 'password', :with => "shaik123"
        click_button 'Log in'
        expect(page).to have_text("Admin Dashboard")
        
        
        
        expect(page).to have_text("Timings")
        click_link "Timings"
        expect(page).to have_text("Day")
        expect(page).to have_text("Time")
        expect(page).to have_text("Action")
        visit '/timings/new'
        expect(page).to have_text("All users")
        click_button "Add Timing"
        expect(page).to have_text("3 errors prohibited this location from being saved:")
        expect(page).to have_text("Day can't be blank")
        expect(page).to have_text("Hours can't be blank")
        expect(page).to have_text("Minutes can't be blank")
        select "Mon", from: 'timing_day', visible: false
        click_button "Add Timing"
        expect(page).to have_text("2 errors prohibited this location from being saved:")
        #expect(page).to have_text("Day can't be blank")
        expect(page).to have_text("Hours can't be blank")
        expect(page).to have_text("Minutes can't be blank")
        select "1", from: 'timing_hours', visible: false
        click_button "Add Timing"
        expect(page).to have_text("1 error prohibited this location from being saved:")
        #expect(page).to have_text("Day can't be blank")
        #expect(page).to have_text("Hours can't be blank")
        expect(page).to have_text("Minutes can't be blank")
        select "00", from: 'timing_minutes', visible: false
        select "pm", from: 'timing_ampm', visible: false
        click_button "Add Timing"
        expect(page).to have_text("Timing was successfully created.")
        
        expect(page).to have_text("Locations")
        click_link "Locations"
        expect(page).to have_text("Location ID")
        expect(page).to have_text("Location")
        expect(page).to have_text("Action")
        visit '/locations/new'
        expect(page).to have_text("All users")
        click_button "Add Location"
        expect(page).to have_text("1 error prohibited this location from being saved:")
        expect(page).to have_text("Location can't be blank")
        fill_in 'location_location', :with => "Gardens"
        click_button "Add Location"
        expect(page).to have_text("Location was successfully created.")
        
        expect(page).to have_text("Providers")
        click_link "Providers"
        expect(page).to have_text("Provider ID")
        expect(page).to have_text("Provider")
        expect(page).to have_text("Action")
        visit '/providers/new'
        expect(page).to have_text("All users")
        click_button "Add Provider"
        expect(page).to have_text("1 error prohibited this provider from being saved:")
        expect(page).to have_text("Provider can't be blank")
        fill_in 'provider_provider', :with => "Lyca"
        click_button "Add Provider"
        expect(page).to have_text("Provider was successfully created.")
        
        expect(page).to have_text("Log out")
        click_link "Log out"
        expect(page).to have_text("Don't have an account?")
        fill_in 'email', :with => "shaik@gmail.com"
        fill_in 'password', :with => "shaik123"
        click_button 'Log in'
        expect(page).to have_text("Admin Dashboard")
        expect(page).to have_text("Log out")
        click_link "Log out"
        
        
        
        
        
        #Create user first
        visit '/users/new'
        
        fill_in('user_name', :with => 'xyza')
        fill_in('user_email', :with => 'abcd@test.com')
        fill_in('user_phone', :with => '9876543210')
        fill_in('user_password', :with => 'qwerty')
        fill_in('user_pref_amount', :with => '23')
        select "Lyca", from: "user_pref_provider", visible: false
        select "Gardens", from: "user_pref_location", visible: false
        click_button('Sign Up')
        
        #debugger
        expect(page).to have_content("User was successfully created.")
    end
    it 'can sign in with correct Email and Password' do
        #Test Login 
        visit '/login'
        fill_in 'email', :with => "abcd@test.com"
        fill_in 'password', :with => "qwerty"
        click_button 'Log in'
        expect(page).to have_text("Log out")
    end
    it 'cannot sign in with incorrect Password' do
        #Test Login 
        visit '/login'
        fill_in 'email', :with => "abcd@test.com"
        fill_in 'password', :with => "q"
        click_button 'Log in'
        expect(page).to have_text("Invalid email/password")
    end
    it 'cannot sign in with incorrect Email' do
        #Test Login 
        visit '/login'
        fill_in 'email', :with => "ab"
        fill_in 'password', :with => "qwerty"
        click_button 'Log in'
        expect(page).to have_text("Invalid email/password")
    end
    it 'reset password' do
        #Test Login 
        visit '/login'
        expect(page).to have_text("Forgot Password?")
        click_link "Forgot Password?"
        expect(page).to have_text("Resets Password")
        #fill_in 'email', :with => "abcd@test.com"
        click_button "Reset Password"
        expect(page).to have_text("Email sent with password reset instructions.")
    end
    it 'sign out successfully' do
        visit '/login'
        fill_in 'email', :with => "abcd@test.com"
        fill_in 'password', :with => "qwerty"
        click_button 'Log in'
        expect(page).to have_text("Log out")
        click_link "Log out"
        expect(page).to have_text("Don't have an account?")
    end
    it 'schedule a pickup' do
        visit '/login'
        fill_in 'email', :with => "abcd@test.com"
        fill_in 'password', :with => "qwerty"
        click_button 'Log in'
        expect(page).to have_text("Schedule a pickup")
        click_link "Schedule a pickup"
        expect(page).to have_text("Select your service provider")
        expect(page).to have_text("Select a pickup date")
        expect(page).to have_text("When should we recharge?")
        #hardcoded
        select "11 Dec 2017 - 01:00 pm", from: "transaction_pickupDate", visible: false
        select "11 Dec 2017", from: "transaction_rechargeDate", visible: false
        
        expect(page).to have_text("Select location")
        fill_in 'transaction_amount', :with => "123"
        click_button 'Schedule'
        expect(page).to have_text("Transaction was successfully created.")
        expect(page).to have_text("123")
        expect(page).to have_text("Scheduled")
        fill_in 'search_phone', :with => "123"
        click_button "Search"
        
    end
    it 'edit profile' do
        visit '/login'
        fill_in 'email', :with => "abcd@test.com"
        fill_in 'password', :with => "qwerty"
        click_button 'Log in'
        expect(page).to have_text("Edit profile")
        click_link "Edit profile"
        expect(page).to have_text("Choose a password of at least 6 characters")
        fill_in 'user_phone', :with => "11111111111111111010"
        click_button 'Save'
        expect(page).to have_text("Phone is the wrong length (should be 10 characters)")
        fill_in 'user_phone', :with => "9876543210"
        fill_in 'user_name', :with => "xyz123"
        click_button 'Save'
        expect(page).to have_text("User was successfully updated.")
        #expect(page).to have_text("xyz123")
    end
    
end
