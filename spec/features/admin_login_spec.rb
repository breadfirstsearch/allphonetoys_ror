require 'rails_helper'
describe "On the homepage, admins" do
    before(:each) do
        #Create admin first
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
        
    end
    it 'can sign up successfully' do
        #Create admin first
        visit '/admins'
        #expect(page).to have_content("New Admin")
        #click_link "New Admin"
        #expect(page).to have_content("Email")
        
        #fill_in('admin_name', :with => 'shaik1')
        #fill_in('admin_email', :with => 'shaik1@gmail.com')
        #fill_in('admin_password', :with => 'shaik123')
        #click_button('Create Admin')
        
        #debugger
        #expect(page).to have_content("Admin was successfully created.")
        #visit '/admins'
        expect(page).to have_content("Show")
        click_link "Show"
        expect(page).to have_content("Name: shaik")
        expect(page).to have_content("Email: shaik@gmail.com")
        expect(page).to have_content("Password: shaik123")
        expect(page).to have_content("Back")
        click_link "Back"
        current_path = URI.parse(current_url).path
        if current_path.respond_to? :should
            current_path.should == ('/admins')
        else
            assert_equal ('/admins'), current_path
        end
        
        expect(page).to have_content("Edit")
        click_link "Edit"
        fill_in('admin_name', :with => 'shaik12')
        click_button "Update Admin"
        expect(page).to have_content("Admin was successfully updated.")
        expect(page).to have_content("Name: shaik12")
        current_path = URI.parse(current_url).path
        if current_path.respond_to? :should
            current_path.should == ('/admins/1')
        else
            assert_equal ('/admins/1'), current_path
        end
        click_link "Back"
        
        
        expect(page).to have_content("Destroy")
        click_link "Destroy"
        expect(page).to have_content("Admin was successfully destroyed.")
        
        
    end
    it 'can sign in with correct Email and Password' do
        #Test Login 
        expect(page).to have_text("Log out")
        click_link "Log out"
        expect(page).to have_text("Don't have an account?")
        fill_in 'email', :with => "shaik@gmail.com"
        fill_in 'password', :with => "shaik123"
        click_button 'Log in'
        expect(page).to have_text("Admin Dashboard")
    end
    it 'sign out successfully' do
        expect(page).to have_text("Log out")
        click_link "Log out"
        expect(page).to have_text("Don't have an account?")
        fill_in 'email', :with => "shaik@gmail.com"
        fill_in 'password', :with => "shaik123"
        click_button 'Log in'
        expect(page).to have_text("Admin Dashboard")
        expect(page).to have_text("Log out")
        click_link "Log out"
        #expect(page).to have_text("Don't have an account?")
    end
    before(:each) do
        visit '/login'
        expect(page).to have_text("Don't have an account?")
        fill_in 'email', :with => "shaik@gmail.com"
        fill_in 'password', :with => "shaik123"
        click_button 'Log in'
        expect(page).to have_text("Admin Dashboard")
    end
    it 'view all users list' do
        expect(page).to have_text("All users")
        click_link "All users"
        expect(page).to have_text("Name")
        expect(page).to have_text("Email")
    end
    it 'view all transactions list' do
        expect(page).to have_text("Transactions")
        click_link "Transactions"
        expect(page).to have_text("Name")
        expect(page).to have_text("Amount")
        expect(page).to have_text("Phonenumber")
        expect(page).to have_text("Provider")
        expect(page).to have_text("Location")
        expect(page).to have_text("Status")
    end
    it 'view all Pickups list' do
        expect(page).to have_text("Pickups")
        click_link "Pickups"
        expect(page).to have_text("Name")
        expect(page).to have_text("Amount")
        expect(page).to have_text("Phonenumber")
        expect(page).to have_text("Provider")
        expect(page).to have_text("Location")
        expect(page).to have_text("Status")
    end
    it 'view all Recharges list' do
        expect(page).to have_text("Recharges")
        click_link "Recharges"
        expect(page).to have_text("Name")
        expect(page).to have_text("Amount")
        expect(page).to have_text("Phonenumber")
        expect(page).to have_text("Provider")
        expect(page).to have_text("Location")
        expect(page).to have_text("Status")
    end
    it 'view all Timings list' do
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
        
        visit '/timings/1/edit'
        select "15", from: 'timing_minutes', visible: false
        click_button "Update timing"
        expect(page).to have_text("Timing was successfully updated.")
    end
    it 'remove a Timing from list' do
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
        
        visit '/timings/1/edit'
        select "15", from: 'timing_minutes', visible: false
        click_button "Update timing"
        expect(page).to have_text("Timing was successfully updated.")
        click_link "1"
        expect(page).to have_text("Timing was successfully destroyed")
    end
    it 'view all Locations list' do
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
    end
    it 'remove a Location frm list' do
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
        click_link "1"
        expect(page).to have_text("Location was successfully destroyed")
    end
    it 'view all Providers list' do
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
    end
    it 'remove a provider' do
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
        click_link "1"
        expect(page).to have_text("Provider was successfully destroyed")
    end
    it 'Redirect AllPhoneToys label to the same page' do
        expect(page).to have_text("All Phone Toys")
        click_link "All Phone Toys"
        #Then I am on the admin dashboard page
        current_path = URI.parse(current_url).path
        if current_path.respond_to? :should
            current_path.should == ('/adminDashboard')
        else
            assert_equal ('/adminDashboard'), current_path
        end
        expect(page).to have_text("Admin Dashboard")
    end
end