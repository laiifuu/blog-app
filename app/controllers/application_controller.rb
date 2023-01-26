class ApplicationController < ActionController::Base
  def current_user
    @current_user = User.all.first
  end
end
