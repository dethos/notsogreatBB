require 'spec_helper'
require 'rails_helper'

describe "Forum Creation", :type => :feature, :js => true do
  before do
    @title = "A new Forum"
    @description = "A new description"
  end

  it "can add new forums" do
    visit '/forums/new'
    within '#new_forum' do
      fill_in 'Title', :with => @title
      fill_in 'Description', :with => @description
    end
    click_button 'Create Forum'
    expect(page).to have_content "Forum was successfully created."
  end

  it "can view new forum in the list" do
    visit '/'
    click_link @title
    expect(page).to have_content @title
  end
end