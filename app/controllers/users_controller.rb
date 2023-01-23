class UsersController < ApplicationController
  def index
    puts :users
  end

  def show
    user_id = params[:id].to_i
    puts User.find(user_id)
  end
end
