class SearchController < ApplicationController
  def index
    if params[:q]
      @messages = Message.where("content LIKE ?", "%#{params[:q]}%")
    end
  end
end
