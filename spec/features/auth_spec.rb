require 'spec_helper'
require 'rails_helper'

describe "Authentication", :type => :feature, :js => true do
  before do
    @email = 'user@example.com'
    @password = 'that_password'
  end

  it "allows the user to sign up" do
    visit '/users/sign_up'
    within("#new_user") do
      fill_in 'Email', :with => @email
      fill_in 'Password', :with => @password
      fill_in 'Password confirmation', :with => @password
    end
    click_button 'Sign up'
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end

  it "shows new user in the users list" do
    visit '/users'
    expect(page).to have_content @email
  end

  it "is able to find user with filter" do
    visit '/users'
    find('#filter').set(@email)
    within "#filter_form" do
      click_button 'Submit'
    end
    expect(page).to have_content @email
  end

  it "allow a logged out users to sign in and logout" do
    visit '/users/sign_in'
    within("#new_user") do
      fill_in "Email", :with => @email
      fill_in "Password", :with => @password
    end
    click_button "Log in"
    expect(page).to have_content "Signed in successfully."
    within '#menu' do
      click_link 'Logout'
    end
    expect(page).to have_content 'Signed out successfully.'
  end
end
