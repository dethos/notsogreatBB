class UsersController < ApplicationController
  def index
    if params[:q]
      @users = User.where("email = '#{params[:q]}'")
    else
      @users =User.all
    end
  end
end
