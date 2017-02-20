class RenameColumnfirstNameinUsersTofirstname < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :lastName, :lastname
    rename_column :users, :firstName, :firstname
  end
end
