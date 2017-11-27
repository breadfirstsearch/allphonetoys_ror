require 'rails_helper'
describe "On the homepage, admins" do
    
    it 'can sign up successfully' do
        #Create admin first
        visit '/admins'
        expect(page).to have_content("New Admin")
        click_link "New Admin"
        expect(page).to have_content("Email")
        
        fill_in('admin_name', :with => 'shaik1')
        fill_in('admin_email', :with => 'shaik1@gmail.com')
        fill_in('admin_password', :with => 'shaik123')
        click_button('Create Admin')
        
        #debugger
        expect(page).to have_content("Admin was successfully created.")
    end
    
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
    it 'view all Locations list' do
        expect(page).to have_text("Locations")
        click_link "Locations"
        expect(page).to have_text("Location ID")
        expect(page).to have_text("Location")
        expect(page).to have_text("Action")
    end
    it 'view all Providers list' do
        expect(page).to have_text("Providers")
        click_link "Providers"
        expect(page).to have_text("Provider ID")
        expect(page).to have_text("Provider")
        expect(page).to have_text("Action")
    end
    it 'Redirect AllPhoneToys label to the same page' do
        expect(page).to have_text("All Phone Toys")
        click_link "All Phone Toys"
        #Then I am on the admin dashboard page
        expect(page).to have_text("Admin Dashboard")
    end
end