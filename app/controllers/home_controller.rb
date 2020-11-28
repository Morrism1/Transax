class HomeController < ApplicationController
  def index
    redirect_to user_path(current_user) if logged_in?
  end
end
