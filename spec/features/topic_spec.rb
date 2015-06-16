require 'spec_helper'
require 'rails_helper'

describe "Topic Creation", :type => :feature, :js => true do
  before do
    @title = "Topic about stuff"
  end

  context "topics" do
    let(:forum) { FactoryGirl.create(:forum) }

    it "allow to create new topic in a forum" do
      visit "/forums/#{forum.id}"
      click_link "New Topic"
      within "#new_topic" do
        fill_in 'Title', :with => @title
      end
      click_button "Create Topic"
      expect(page).to have_content "Topic was successfully created."
    end
  end
end