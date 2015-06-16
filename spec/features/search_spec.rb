require 'spec_helper'
require 'rails_helper'

describe "Search functionality", :type => :feature, :js => true do
  context 'Search' do
    let(:forum) { FactoryGirl.create(:forum) }
    let(:topic) { FactoryGirl.create(:topic, forum:forum) }
    let(:message) { FactoryGirl.create(:message, topic:topic) }

    it "allow to user to search for messages" do
      visit '/'
      within "#search-form" do
        find("#search-input").set(message.content)
        click_button "Submit"
      end
      expect(find("#message-#{message.id}")).to have_content message.content
    end
  end
end