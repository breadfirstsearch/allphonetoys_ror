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
    end
    it 'can sign in with correct Email and Password' do
        #Test Login 
        visit '/login'
        expect(page).to have_text("Don't have an account?")
        fill_in 'email', :with => "shaik@gmail.com"
        fill_in 'password', :with => "shaik123"
        click_button 'Log in'
        expect(page).to have_text("Admin Dashboard")
    end
    it 'sign out successfully' do
        visit '/login'
        expect(page).to have_text("Don't have an account?")
        fill_in 'email', :with => "shaik@gmail.com"
        fill_in 'password', :with => "shaik123"
        click_button 'Log in'
        expect(page).to have_text("Admin Dashboard")
        expect(page).to have_text("Log out")
        click_link "Log out"
        expect(page).to have_text("Don't have an account?")
    end
end