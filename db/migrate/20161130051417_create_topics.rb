class CreateTopics < ActiveRecord::Migration[5.0]
  def change
    create_table :topics do |t|
      t.string :title
      t.string :description
      t.string :endDate
      t.boolean :enable
      t.string :owner

      t.timestamps
    end
  end
end
