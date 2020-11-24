class GroupsController < ApplicationController

  def index
    @groups = Group.all.order(created_at: :desc)
  end

  def new
    @group = current_user.groups.build
  end

  def show
    @group = Group.find(params[:id])
    @transactions = @group.transactions.includes(:user)
    @total = @group.transactions.sum('amount')
  end

  def create
    @group = current_user.groups.build(group_params)
    if @group.save
      flash[:notice] = "Group Successfully created..."
      redirect_to @group
    else
      render :new
    end
  end
  
  def destroy; end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
