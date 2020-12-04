class TransactionsController < ApplicationController

  before_action :logged_in_user

  def index
    @transaction = current_user.transactions.includes(:groups).order(created_at: :desc)
    @transaction = @transaction.filter { |trans| !trans.groups.empty? }
    @total = 0
    @transaction.each { |trans| @total += trans.amount }
  end

  def new
    @transaction = current_user.transactions.build
  end

  def create
    @transaction = current_user.transactions.build(transaction_params.except(:group_ids))
    @transaction.author_id = current_user.id
    @transaction.save
    @groupers = params[:transaction][:group_ids]
    @groupers&.each do |grp|
      @transaction.groups << Group.find(grp)
    end
    if @transaction.save
      if Group.none? || params[:transaction][:group_ids].all?('0')
        GroupTransaction.create(transaction_id: @transaction.id)
      else
        params[:transaction][:group_ids].reject { |n| n.to_i.zero? }.each do |id|
          GroupTransaction.create(transaction_id: @transaction.id, group_id: id.to_i)
        end
      end
      redirect_to transactions_path
    else
      render :new
    end
  end

  def external_transactions
    all_transactions = current_user.transactions.pluck(:id)
    grouped = GroupTransaction.where(transaction_id: all_transactions).pluck(:transaction_id)
    ungrouped = all_transactions - grouped
    @external = current_user.transactions.where(id: ungrouped).includes([:groups])
    @total = 0
    @external.each { |trans| @total += trans.amount }
  end

  def show
    @transaction = current_user.transactions.find(params[:id])
  end

  private

  def transaction_params
    params.require(:transaction).permit(:name, :amount)
  end
end
