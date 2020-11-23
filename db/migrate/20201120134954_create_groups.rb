class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.string :name, unique: true, null: false
      t.string :icon, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :groups, :name
  end
end
