class CreatePrivatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :private_posts do |t|
      t.string :body
      t.integer :privatereplyto
      t.string :emailBuyer

      t.timestamps
    end
  end
end
