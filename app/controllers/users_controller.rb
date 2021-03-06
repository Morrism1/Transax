class UsersController < ApplicationController
  before_action :logged_in_user, only: %i[show]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'Logged in successful'
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash.now.alert = @user.errors.full_messages.to_sentence
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
