class CreateUserPreferences < ActiveRecord::Migration[5.0]
  def change
    create_table :user_preferences do |t|
      t.string :subscribedThread

      t.timestamps
    end
  end
end
