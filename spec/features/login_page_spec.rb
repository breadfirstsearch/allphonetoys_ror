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
        click_button('Sign Up')
        
        #debugger
        expect(page).to have_content("User was successfully created.")
    end
    before(:each) do
        #Create user first
        visit '/users/new'
        
        fill_in('user_name', :with => 'xyza')
        fill_in('user_email', :with => 'abcd@test.com')
        fill_in('user_phone', :with => '9876543210')
        fill_in('user_password', :with => 'qwerty')
        fill_in('user_pref_amount', :with => '23')
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
end
