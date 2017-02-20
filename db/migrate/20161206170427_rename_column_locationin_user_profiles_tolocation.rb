class RenameColumnLocationinUserProfilesTolocation < ActiveRecord::Migration[5.0]
  def change
    rename_column :user_profiles, :Location, :location
    rename_column :user_profiles, :lastTopic, :lasttopic
  end
end
