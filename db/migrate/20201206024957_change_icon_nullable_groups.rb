class ChangeIconNullableGroups < ActiveRecord::Migration[6.0]
  def change
    change_column_null :groups, :icon, true
  end
end
