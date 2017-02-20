class CreateUserProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :user_profiles do |t|
      t.boolean :enable
      t.boolean :connected
      t.string :Location
      t.string :avatar
      t.string :rating
      t.string :lastTopic

      t.timestamps
    end
  end
end
