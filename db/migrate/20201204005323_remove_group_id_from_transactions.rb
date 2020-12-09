class RemoveGroupIdFromTransactions < ActiveRecord::Migration[6.0]
  def change
    remove_reference :transactions, :group, null: false, foreign_key: true
  end
end
