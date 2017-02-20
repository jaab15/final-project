class RenameColumnuserNameinTableUsertousername < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :userName, :username
  end
end
