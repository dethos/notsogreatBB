require 'spec_helper'
require 'rails_helper'

describe "Message creation", :type => :feature, :js => true do
  context 'Messages' do

    let(:forum) { FactoryGirl.create(:forum) }
    let(:topic) { FactoryGirl.create(:topic, forum:forum) }

    it "allows the user to add new messages" do
      visit "/topics/#{topic.id}"
      click_link "Reply"
      within "#new_message" do
        fill_in "Content", :with => "Short reply"
      end

      click_button "Create Message"
      expect(page).to have_content "Message was successfully created."
    end
  end
end