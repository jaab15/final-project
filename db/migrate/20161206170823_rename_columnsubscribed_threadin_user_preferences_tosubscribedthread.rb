class RenameColumnsubscribedThreadinUserPreferencesTosubscribedthread < ActiveRecord::Migration[5.0]
  def change
    rename_column :user_preferences, :subscribedThread, :subscribedthread
  end
end
