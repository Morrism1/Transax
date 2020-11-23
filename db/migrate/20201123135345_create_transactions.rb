class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.string :name, null: false
      t.integer :author_id
      t.integer :amount, null: false
      t.references :group, foreign_key: true

      t.timestamps
    end
    add_index :transactions, :author_id
  end
end
