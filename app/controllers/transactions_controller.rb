class TransactionsController < ApplicationController

  def index
    @transactions = current_user.transactions.includes(:group).where.not(group_id: nil).order(created_at: :desc)
    @total = current_user.transactions.where.not(group_id: nil).sum('amount')
  end

  def new
    @transaction = current_user.transactions.build
  end

  def create
    @transaction = current_user.transactions.build(transaction_params)
    @transaction.author_id = current_user.id

    if @transaction.save
      if @transaction.group_id.nil?
        redirect_to external_path, notice: 'External Transaction was successfully created.'
      else
        redirect_to transactions_path, notice: 'Transaction was successfully created.'
      end
    else
      flash[:alert] = "Can you try fill the fields again"
      render :new
    end
  end

  def external_transactions
    @external = current_user.transactions.where(group_id: nil).order(created_at: :desc)
    @total = current_user.transactions.where(group_id: nil).sum('amount')
  end

  def show
    @transaction = current_user.transactions.find(params[:id])
  end

  private

  def transaction_params
    params.require(:transaction).permit(:name, :amount, :group_id)
  end
end
