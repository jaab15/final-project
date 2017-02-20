class ChangeSubscribedthreadInUserPreferences < ActiveRecord::Migration[5.0]
  def change
    add_column    :user_preferences, :subscribedtopic, :integer
    remove_column :user_preferences, :subscribedthread, :string
  end
end
