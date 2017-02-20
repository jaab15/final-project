class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :body
      t.integer :replyto

      t.timestamps
    end
  end
end
