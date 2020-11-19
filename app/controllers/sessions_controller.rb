class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by_name(params[:session][:name])
    if user
      log_in(user)
      redirect_to user, notice: 'Logged in!'
    else
      flash.now.alert = 'Name already Taken!'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url, notice: 'Logged out!'
  end
end
