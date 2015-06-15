require 'spec_helper'
require 'rails_helper'

describe "Authentication", :type => :feature, :js => true do

  it "allows the user to sign up" do
    visit '/users/sign_up'
    within("#new_user") do
      fill_in 'Email', :with => 'user@example.com'
      fill_in 'Password', :with => 'password'
      fill_in 'Password confirmation', :with => 'password'
    end
    click_button 'Sign up'
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end
end
